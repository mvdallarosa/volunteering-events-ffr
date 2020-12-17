class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
  end

  def new
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
