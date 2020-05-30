class IntegrationsController < ApplicationController
  breadcrumb 'Projects', :projects_path

  before_action :set_project, only: [:new, :add, :edit, :update]

  def new
    @integrations = INTEGRATIONS
    breadcrumb @project.name, @project
  end

  def add
    @project.integrations << "#{params[:id].camelcase}::Integration".constantize.new(enabled: true, config: {})
    redirect_to project_path(@project)
  end

  def edit
    @integration = Integration.find(params[:id])

    breadcrumb @project.name, @project
  end

  def update
    @integration = Integration.find(params[:id])

    config = @integration.try(:build_config, params.require(:integration)) || {}

    @integration.update(integration_params.merge(config: config))

    redirect_to @project
  end

  private

  def set_project
    @project = policy_scope(Project, policy_scope_class: ProjectPolicy::Scope).find(params[:project_id])
  end

  def integration_params
    permitted_params = %i(enabled allowed_to_fail)
    permitted_params << :on_branch if @integration.has_pronto?
    params.require(:integration).permit(*permitted_params)
  end
end
