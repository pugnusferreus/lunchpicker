class Venue < ActiveRecord::Base
  belongs_to :location

  def location_name
      return location.name
  end 
end
