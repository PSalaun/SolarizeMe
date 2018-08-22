class InvestmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new ]

  def show
    @investment = Investment.find(params[:id])
  end

  def new
    @investment = Investment.new
    @project = Project.find(params[:project_id])
  end

  def create
    @investment = Investment.new(params_investment)
    @investment.project = Project.find(params[:project_id])
    @investment.user = current_user
    @investment.state = "pending"
    if @investment.save!
      redirect_to new_project_investment_payment_path(@investment.project, @investment)
    else
      render :new
    end
  end

  private

  def params_investment
    params.require(:investment).permit(:number_of_panels, :status)
  end

end
