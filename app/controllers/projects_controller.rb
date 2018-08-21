class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: :top

  def index
    @projects = Projects.all
  end

  def show
    @project = Project.find[params(:id)]
  end
end

