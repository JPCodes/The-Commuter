class BusinessesController < ApplicationController
  include ApiHelper

  def index
    if cookies[:lat_lng]
      @lat_lng = cookies[:lat_lng].split("|")
      puts @lat_lng.inspect
    end
  end

  def find_businesses
    @found_businesses = JSON.parse(get_businesses(search_params[:term], search_params[:city], search_params[:price_point]))
    @businesses = @found_businesses['businesses']
    respond_to do |format|
      format.html { redirect_to businesses_path }
      format.js
    end
  end

  private
  def search_params
    params.permit(:term, :city, :price_point)
  end
end
