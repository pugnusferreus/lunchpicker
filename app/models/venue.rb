class Venue < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :location_id

  belongs_to :location

  def location_name
    location && location.name
  end

  def sheltered_name
    if sheltered.nil? || sheltered == false
      "No"
    else
      "Yes"
    end
  end

end
