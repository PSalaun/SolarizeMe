require "json"
require "rest-client"

class ForecastApi
  def initialize(project_id)
    # Fetch the project from the database
    puts project_id
    @project = Project.find(project_id.to_i)
    puts @project

  end


  def generate_output
    # fetch  latitude, longitude, etc. and insert them in the url (so url is dynamic)
    lat = @project.lat.class
    lon = @project.lon.class
    kwc = @project.kwc

    # API CALL
    # response = RestClient.get "https://api.forecast.solar/estimate/52.0/12.0/37/0/324.02"
    response = RestClient.get "https://api.forecast.solar/estimate/#{lat.to_s}/#{lon.to_s}/37/0/#{kwc.to_s}"

    repos = JSON.parse(response)
    repos_watt = repos['result']['watts']
    date = Date.today.to_s

    repos_day_production = repos['result']['watt_hours_day'][date]
    repos_watt.each do |key, value|
      output = Output.new ()
      city = Project.where(name: "Paris Offices").first
      output.project = city
      output.detailedtime = DateTime.parse(key)
      output.date = DateTime.parse(key).to_date
      output.quantity = repos_day_production
      output.production = value

      if output.date == Date.today
        output.save!
      end
    end

    # if repos_date
    #   value = repos_date[1]
    #   # with json response, create a new output with the information you get
    #   Output.create(date: Date.today, project: @project, quantity: value)
    # else
    #   Output.create(date: Date.today, project: @project, quantity: 105)
    # end
  end
end

