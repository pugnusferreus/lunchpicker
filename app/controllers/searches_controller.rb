class SearchesController < ApplicationController
  def index
    @search = Search.new
    @search.find_venue(params[:search]) if request.post?
    @venue = @search.venue
    @current_conditions = @search.current_conditions
  end
end
