class ProjectsController < ApplicationController
  breadcrumb 'Projects', :projects_path

  before_action :set_project, only: [:show, :edit, :update]

  def index
    @projects = policy_scope(Project)
  end

  def show
    breadcrumb @project.name, project_path
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to @project
  end

  private

  def set_project
    @project = policy_scope(Project).find(params[:id])
  end

  def project_params
    params.require(:project)
  end
end
