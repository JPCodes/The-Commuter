class DashboardsController < ApplicationController
  def show
    # To display belonging user's name
    @user = Dashboard.find(params[:id]).user
  end
end
