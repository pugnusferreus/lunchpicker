class Venue < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :location_id

  belongs_to :location

  def location_name
      return location && location.name
  end 
end
