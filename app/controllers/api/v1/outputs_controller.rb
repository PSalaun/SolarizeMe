class Api::V1::OutputsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_output, only: [ :show ]

  def index
    @outputs = policy_scope(Output)
  end

  def show

  end

  def create
    # require "json"
    # require "rest-client"

    # response = RestClient.get "https://api.forecast.solar/estimate/watthours/day/52/12/37/0/5.67"
    # repos = JSON.parse(response)
    # raise

    # @output = Output.new(date: repos_date)
    # # @output.user = current_user
    # authorize @output
    # if @output.save
    #   render :show, status: :created
    # else
    #   render_error
    # end
  end

  def update
    if @output.update(output_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_output
    @output = Output.find(params[:id])
    authorize @output  # For Pundit
  end

  # def output_params
  #   # params.require(:output).permit(:date, :quantity, :project)
  #   require "json"
  #   require "rest-client"

  #   response = RestClient.get "https://api.forecast.solar/estimate/watthours/day/52/12/37/0/5.67"
  #   repos = JSON.parse(response)
  #   repos
  #   raise
  # end

  def render_error
    render json: { errors: @output.errors.full_messages },
      status: :unprocessable_entity
  end
end
