require 'spec_helper'

describe Location do
  it 'should create location' do
    location = Location.create! :name => "Location 1", :weather_location => "Braybrook, Victoria"

    location = Location.find(location.location_id)
    location.name.should eql "Location 1"
  end
end
