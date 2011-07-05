require 'spec_helper'

describe Location do
  it 'should create location' do
    location = Location.create! :name => "Location 1", :weather_location => "Braybrook, Victoria"

    location = Location.find(location.location_id)
    location.name.should eql "Location 1"
  end

  it 'should update location' do
    location = Location.create! :name => "Location 1", :weather_location => "Braybrook, Victoria"

    location = Location.find(location.location_id)
    location.name.should eql "Location 1"
    location.name = "Location 1 new name"
    location.save!

    location = Location.find(location.location_id)
    location.name.should eql "Location 1 new name"
  end

  it 'should delete location' do
    location = Location.create! :name => "Location 1", :weather_location => "Braybrook, Victoria"
    location_id = location.location_id
    location.destroy
    lambda{ Location.find(location_id) }.should raise_error
  end
end
