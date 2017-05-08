class BusinessesController < ApplicationController
  include ApiHelper
  skip_before_action :require_authentication!
  def index
    if cookies[:lat_lng]
      @lat_lng = cookies[:lat_lng].split("|")
      puts @lat_lng.inspect
    end
  end

  def find_businesses
    if @found_businesses = JSON.parse(get_businesses(search_params)) then @businesses = @found_businesses['businesses'] else puts 'Yelp Businesses not retrived. (BusinessesController#Find_Businesses)' end
    respond_to do |format|
      format.html { redirect_to businesses_path }
      format.js
    end
  end

  private
  def search_params
    params.permit(:term, :location, :price_point)
  end
end
