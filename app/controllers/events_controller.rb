class EventsController < ApplicationController
  before_action :find_event, only: [ :show, :edit, :update, :destroy ]
  before_action :set_project

  def index
    @events = Event.where(project: @project)
  end

  def show
    @volunteers = User.all.select { |user| user.events.include?(@event) }
  end

  def new
    @project = Project.find(params[:project_id])
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.project = @project
    if @event.save
      create_more
      redirect_to project_events_path(@project)
    else
      render :new
    end
  end

  def create_more
    if @event.repeat == 'ogni settimana'
      event_date = DateTime.parse(params[:event][:date])
      end_date = params[:event][:end_date] == nil ? Date.today + 3.months : params[:event][:end_date]
      loop do
        event_date += 1.week
        break if event_date > Date.parse(end_date)
        event = Event.new(event_params)
        event.date = event_date
        event.project = @project
        event.save
      end
    elsif @event.repeat == 'ogni due settimane'
      event_date = DateTime.parse(params[:event][:date])
      end_date = params[:event][:end_date] == nil ? Date.today + 3.months : params[:event][:end_date]
      loop do
        event_date += 2.weeks
        break if event_date > Date.parse(end_date)
        event = Event.new(event_params)
        event.date = event_date
        event.project = @project
        event.save
      end
    elsif @event.repeat == 'ogni mese'
      event_date = DateTime.parse(params[:event][:date])
      end_date = params[:event][:end_date] == nil ? Date.today + 3.months : params[:event][:end_date]
      loop do
        event_date += 1.month
        break if event_date > Date.parse(end_date)
        event = Event.new(event_params)
        event.date = event_date
        event.project = @project
        event.save
      end
    end
  end

  def edit
  end

  def update
    url = Rails.application.routes.recognize_path(request.referrer)
    if url[:action] == 'show'
      @event.closed = params[:event][:closed] == "0" ? true : false
      @event.save
    else
      raise
      @event.update(event_params)
    end
    redirect_to project_event_path(@project, @event)
  end

  def destroy
    @event.destroy
    redirect_to project_events_path(@project)
  end

  private

  def event_params
    params.require(:event).permit(:date, :location, :activity, :closed, :information, :photo, :repeat, :end_date)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
