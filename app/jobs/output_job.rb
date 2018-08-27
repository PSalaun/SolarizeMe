class OutputJob < ApplicationJob
  queue_as :default

  def perform
    projects = Project.where("comissioning_date <= ?", Date.today)
    projects.each do |project|
      ForecastApi.new(project.id).generate_output
    end
  end
end

# SRP single responsibility principle


