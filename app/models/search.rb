class Search

  def initialize(location_id)
    @location_id = location_id
    if(@location_id.nil?) then
      @location_id = "-1"
    end
  end

  def find_venue()
     @venue = Venue.first(:order => 'random()',:conditions => ["location_id = ?", @location_id])
     @location = Location.find_by_location_id(@location_id)
  end
  
  def venue_name
    if(!@venue.nil?) then
      @venue.name
    end
  end 
  
  def venue_address
    if(!@venue.nil?) then
      @venue.address
    end
  end
  
  def comments
    if(!@venue.nil?) then
      @venue.comments
    end
  end
  
  def location_name
    if(!@location.nil?) then
      @location.name
    end
  end

  def location_id
      @location_id
  end
end
