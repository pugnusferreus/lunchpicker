class Search
  include Validatable
  
  validates_presence_of :location_id

  attr_accessor :location_id, :location_name, :venue_name, :venue_address, :comments, :sheltered, :weather_condition, :weather_temp_c, :weather_wind_condition, :weather_humidity, :weather_icon
  
  def find_venue(loc_id,check_weather)
     @location_id = loc_id
    
    #check if validation pass
    if valid?
      location = Location.find(loc_id)
      google_weather = GoogleWeather.new(location.weather_location)
      has_data = google_weather.weather

      if(check_weather.nil? || check_weather == "false") then
        @venue = Venue.first :order => 'random()', :conditions => ["location_id = ?", @location_id]
      else
        
        needs_shelter = false
        if(has_data.key? 'current_conditions') then
          NEED_SHELTER_WEATHERS.each do |condition|
            if (condition.casecmp(google_weather.current_conditions.condition) == 0) then
              needs_shelter = true
            end
          end

        end    
   
        if(!needs_shelter) then
          @venue = Venue.first :order => 'random()', :conditions => ["location_id = ?", @location_id]
        else
          @venue = Venue.first :order => 'random()', :conditions => ["location_id = ? and sheltered = true", @location_id]
        end
      end
      
      if not @venue.nil?
        @location = Location.find @location_id
        @location_name = @location.name
        @venue_name = @venue.name
        @venue_address = @venue.address
        @comments = @venue.comments
        @sheltered = check_weather


        if(has_data.key? 'current_conditions') then
          @weather_condition = google_weather.current_conditions.condition
          @weather_temp_c = google_weather.current_conditions.temp_c
          @weather_wind_condition = google_weather.current_conditions.wind_condition
          @weather_humidity = google_weather.current_conditions.humidity
          @weather_icon = WEATHER_ICON_ROOT_PATH + google_weather.current_conditions.icon

        end
      end
      
    end
    
  end
  
end
