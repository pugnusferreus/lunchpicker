class SearchesController < ApplicationController
  layout 'default'
  
  def index
    @search = Search.new
    @search.find_venue(params[:search][:location_id], params[:search][:sheltered]) if request.post?
  end
end
