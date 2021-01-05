class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @projects = Project.all
  end

  def registrations
    @registrations = Registration.where(user_id: current_user.id)
  end

  def volunteers
    @volunteers = User.where(admin: false)
  end
end
