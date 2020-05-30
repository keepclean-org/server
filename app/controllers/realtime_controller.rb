class RealtimeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def manifest
    project = Project.find_by_name(params[:project])
    if project
      return render json: {
        rubocop_enabled: project.rubocop_enabled
      }
    else
      Project.create(name: params[:project])
      render plain: 'Project initiated, process to setup here: ', status: :created
      return
    end
  end
end
