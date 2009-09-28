class SearchesController < ApplicationController
  def index
    @location = Location.all
    
    
    @search = Search.new
    @search.find_venue(params[:location])
    
  end
end
