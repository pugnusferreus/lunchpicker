require 'spec_helper'

describe Location do
  it 'should create location' do
    location = Location.new(:name => "Location 1", :weather_location => "Braybrook, Victoria")
    location.save

    location = Location.find(location.location_id)
    location.name.should eql("Location 1")
  end
end