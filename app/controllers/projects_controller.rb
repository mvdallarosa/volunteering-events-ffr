class ProjectsController < ApplicationController
  before_action :find_project, only: [ :show, :edit, :update, :destroy ]

  def index
    @projects = Project.all.select { |project| project.events.count > 0 }
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @projects = Project.all
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to projects_path
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to projects_path
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :photo)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
