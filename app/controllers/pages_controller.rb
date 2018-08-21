class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home, :learn_more

  def home
  end
end
