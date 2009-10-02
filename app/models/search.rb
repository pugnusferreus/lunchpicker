class Search
  include Validatable
  
  validates_presence_of :location_id

  attr_accessor :location_id, :location_name, :venue_name, :venue_address, :comments
  
  def find_venue(loc_id)
     @location_id = loc_id
     
    if valid?
       
      @venue = Venue.first :order => 'random()', :conditions => ["location_id = ?", @location_id]
      
      if not @venue.nil?
        @location = Location.find @location_id
        @location_name = @location.name
        @venue_name = @venue.name
        @venue_address = @venue.address
        @comments = @venue.comments
      end
      
    end
    
  end
  
end
