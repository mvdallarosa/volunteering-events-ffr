class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @project = Project.find(params[:project_id])
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.project = @project
    if @event.save
      redirect_to project_events_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to project_events_path
  end

  def destroy
    @event.destroy
    redirect_to project_events_path
  end

  private

  def event_params
    params.require(:event).permit(:date, :location, :capacity, :closed, :information, :photo)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
