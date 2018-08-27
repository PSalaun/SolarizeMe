require "json"
require "rest-client"

class ForecastApi
  def initialize(project_id)
    # Fetch the project from the database
    @project = Project.find(project_id)
  end


  def generate_output
    # fetch  latitude, longitude, etc. and insert them in the url (so url is dynamic)
    lat = @project.lat
    lon = @project.lon
    kwc = @project.kwc

    # API CALL
    response = RestClient.get "https://api.forecast.solar/estimate/watthours/day/#{lat}/#{lon}/37/0/#{kwc}"
    repos = JSON.parse(response)
    repos_date = repos['result'].first
    if repos_date
      value = repos_date[1]
      # with json response, create a new output with the information you get
      Output.create(date: Date.today, project: @project, quantity: value)
    else
      Output.create(date: Date.today, project: @project, quantity: 101)
    end
  end
end

