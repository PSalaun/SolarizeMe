class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!

  def index

    if params[:query].present?
      @projects = Project.where(id: params[:query])
    else
      @projects = Project.all
    end
  end

  def show
    @project = Project.find(params[:id])
  end
end

