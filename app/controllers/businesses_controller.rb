class BusinessesController < ApplicationController
  def index
    if cookies[:lat_lng]
      @lat_lng = cookies[:lat_lng].split("|")
      puts @lat_lng.inspect
    end
  end
end
