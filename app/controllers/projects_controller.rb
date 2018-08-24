class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
   if params[:query].present?
      @projects = policy_scope(Project).where(id: params[:query])
    else
      @projects = policy_scope(Project).all
    end
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
  end
end

