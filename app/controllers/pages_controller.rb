class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @events = Event.all
  end

  def registrations
    @registrations = Registration.where(user_id: current_user.id)
  end
end
