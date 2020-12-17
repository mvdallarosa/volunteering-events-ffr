class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    @registration.user = current_user
    @registration.event = @event
    @registration.save
    redirect_to project_registrations_path
  end

  def edit
  end

  def update
    @registration.update(registration_params)
    redirect_to project_event_path(@event)
  end

  def destroy
    @registration.destroy
    redirect_to project_event_path(@event)
  end

  private

  def registration_params
    params.require(:registration).permit(:note, :car)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def find_registration
    @registration = Registration.find(params[:id])
  end
end
