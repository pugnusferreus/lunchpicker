class Location < ActiveRecord::Base
  validates_presence_of :location_id
  validates_exclusion_of :location_id, :in => '', :message => "Please select a location"
  has_many :places
end
