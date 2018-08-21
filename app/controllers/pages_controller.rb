class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :learn_more]

  def home
    top
  end

  def learn_more
  end

  private

  def top
    @projects = Project.where("end_date > ?", Date.today).where("start_date < ?", Date.today).order(end_date: :asc).limit(3)
  end
end
