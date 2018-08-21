class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: :top

  def index
    @projects = Projects.all
  end

  def show
    @project = Project.find[params(:id)]
  end

  def top
    @projects = Project.where("end_date > ?", Date.today).where("start_date < ?", Date.today).order(end_date: :asc).limit(3)
  end
end

