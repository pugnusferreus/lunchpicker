class SearchesController < ApplicationController
  layout 'default'
  
  def index
    @search = Search.new
    @search.find_venue(params[:location_id],params[:sheltered]) if request.post?
  end
end
