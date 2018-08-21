class InvestmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new ]

  def show

  end

  def new
    @investment = Investment.new
    @project = Project.find(params[:project_id])
  end

  def create
    @investment = Investment.new(params_investment)
    @investment.project = Project.find(params[:project_id])
    @investment.user = current_user
    @investment.status = "pending"
    if @investment.save!
      redirect_to user_investment_path(current_user, @investment)
    else
      render :new
    end
  end

  private

  def params_investment
    params.require(:investment).permit(:number_of_panels, :status)
  end

end
