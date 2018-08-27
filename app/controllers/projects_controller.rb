class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # raise
    if params[:location].present?
      @projects = policy_scope(Project).where(country: params[:location])
    elsif params[:status].present?
      @projects = policy_scope(Project).all.select { |project| params[:status].include?(project.status)}
    elsif params[:location].present? && params[:status].present?
      @location_filtered_projects = policy_scope(Project).where(country: params[:location])
      @projects = @location_filtered_projects.select { |project| params[:status].include?(project.status)}
    else
      @projects = policy_scope(Project).all
    end
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
  end
end

