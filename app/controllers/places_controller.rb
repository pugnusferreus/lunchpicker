class PlacesController < ApplicationController
  def index
    @location = Location.all

    @place = Place.first(:order => 'random()',:conditions => ["location_id = ?", params[:location]])

    @foo='bar'
  end
end
