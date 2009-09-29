class Search

  def initialize(location_id)
    @location_id = location_id
    if(@location_id.nil?) then
      @location_id = "-1"
    end
  end

  def find_venue()
     @place = Venue.first(:order => 'random()',:conditions => ["location_id = ?", @location_id])
     @location = Location.find_by_location_id(@location_id)
  end
  
  def venue_name
    if(!@place.nil?) then
      @place.name
    end
  end 
  
  def venue_map_url
    if(!@place.nil?) then
      @place.map_url
    end
  end
  
  def comments
    if(!@place.nil?) then
      @place.comments
    end
  end
  
  def location_name
    if(!@place.nil?) then
      @location.name
    end
  end

  def location_id
      @location_id
  end
end
