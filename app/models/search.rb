class Search
  def find_venue(location_id)
     puts "##########"
     if(location_id.nil?) then
       location_id = "-1"
     end
     puts location_id.nil?
     puts location_id
     @place = Venue.first(:order => 'random()',:conditions => ["location_id = ?", location_id])
     @location = Location.find_by_location_id(location_id)
  end
  
  def venue_name
    if(!@place.nil?)
      @place.name
    end
  end 
  
  def venue_map_url
    if(!@place.nil?)
      @place.map_url
    end
  end
  
  def comments
    if(!@place.nil?)
      @place.comments
    end
  end
  
  def location_name
    if(!@place.nil?)
      @location.name
    end
  end
end
