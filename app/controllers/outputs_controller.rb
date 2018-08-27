# class OutputsController < ApplicationController
#   def create
#     require "json"
#     require "rest-client"

#     response = RestClient.get "https://api.forecast.solar/estimate/watthours/day/52/12/37/0/5.67"
#     repos = JSON.parse(response)
#     raise

#     @output = Output.new(date: repos_date)
#     @output.user = current_user
#     authorize @output
#     if @output.save
#       render :show, status: :created
#     else
#       render_error
#     end
#   end
# end
