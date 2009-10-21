class Search
  include Validatable
  
  attr_accessor :location_id, :sheltered
  
  validates_presence_of :location_id
  validates_presence_of :sheltered
  
  attr_accessor :venue, :current_conditions
  
  def find_venue(options)
    @location_id = options[:location_id]
    @sheltered = ["1", true].include? options[:sheltered]
    
    return unless valid?
    
    location = Location.find(@location_id)
    google_weather = GoogleWeather.new(location.weather_location)
    has_data = google_weather.weather

    if not @sheltered
      @venue = Venue.first :order => 'random()', :conditions => ["location_id = ?", @location_id]
    else
      
      needs_shelter = false
      if has_data.key? 'current_conditions'
        NEED_SHELTER_WEATHERS.each do |condition|
          if (condition.casecmp(google_weather.current_conditions.condition) == 0) then
            needs_shelter = true
          end
        end
      end
      
      if not needs_shelter
        @venue = Venue.first :order => 'random()', :conditions => ["location_id = ?", @location_id]
      else
        @venue = Venue.first :order => 'random()', :conditions => ["location_id = ? and sheltered = true", @location_id]
      end
      
    end
    
    @current_conditions = has_data.key?('current_conditions') ? google_weather.current_conditions : nil
    
  end
  
end
