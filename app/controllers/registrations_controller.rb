class RegistrationsController < ApplicationController
  before_action :find_registration, only: [ :edit, :update, :destroy ]
  before_action :set_project
  before_action :set_event

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    @registration.user = current_user
    @registration.event = @event
    if @registration.save
      redirect_to user_registrations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @registration.update(registration_params)
    redirect_to project_event_path(@project, @event)
  end

  def destroy
    @registration.destroy
    redirect_to user_registrations_path
  end

  private

  def registration_params
    params.require(:registration).permit(:note, :car)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def find_registration
    @registration = Registration.find(params[:id])
  end
end
