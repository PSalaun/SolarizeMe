class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:query].present?
      @projects = policy_scope(Project).where(country: params[:query])
    else
      @projects = policy_scope(Project).all
    end

  end

  def show
    @project = Project.find(params[:id])
    authorize @project
    @projects = Project.where.not(latitude: nil, longitude: nil)
    @markers = @projects.map do |project|
      {
        lat: project.latitude,
        lng: project.longitude
      }
    end
  end
end

