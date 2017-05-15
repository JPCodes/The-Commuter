class DashboardsController < ApplicationController
  def show
    @dashboard = Dashboard.find(params[:id])
    # To display belonging user's name
    @user = @dashboard.user
  end
end
