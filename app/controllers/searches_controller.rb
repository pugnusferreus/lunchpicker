class SearchesController < ApplicationController
  def index
    @search = Search.new
    @search.find_venue(params[:location_id]) if request.post?
  end
end
