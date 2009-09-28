class PlacesController < ApplicationController
  def index
    @location = Location.all

    @search = Search.first(:order => 'random()',:conditions => ["location_id = ?", params[:location]])

  end
end
