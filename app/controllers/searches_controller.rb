class SearchesController < ApplicationController
  def index
    @location = Location.all
    
    
    @search = Search.new(params[:location])
    @search.find_venue
     
  end
end
