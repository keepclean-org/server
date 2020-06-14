class RealtimeController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def pundit_user
    @user
  end

  def manifest
    @user = User.find_by_token(params[:token])
    unless @user
      render plain: "Wrong token, get your token at: #{account_url}", status: :unauthorized
      return
    end

    project = policy_scope(Project, policy_scope_class: ProjectPolicy::Scope).find_by_name(params[:project])
    if project
      project.update(last_run: Time.now)

      unless project.integrations.count > 0
        render plain: "Project ready, process to setup here: #{project_url(project)}", status: :created
        return
      end

      manifest = {
          configuration_url: project_url(project),
      }

      project.integrations.each do |integration|
        manifest[integration.key] = {
          enabled: integration.enabled,
          allowed_to_fail: integration.allowed_to_fail,
          on_branch: integration.on_branch,
          config: integration.config
        }
      end

      return render json: manifest
    else
      project = Project.create(name: params[:project], user: @user)
      render plain: "Project initiated, process to setup here: #{project_url(project)}", status: :created
      return
    end
  end
end
