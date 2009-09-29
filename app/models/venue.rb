class Venue < ActiveRecord::Base
  belongs_to :location

  def location_name
      return location && location.name
  end 
end
