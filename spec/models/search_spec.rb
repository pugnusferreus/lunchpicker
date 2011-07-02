require 'spec_helper'

describe Search do
  before(:each) do
    @braybrook = Location.new(:name => "Braybrook", :weather_location => "Braybrook, Victoria")
    @braybrook.save

    @braybrook_venue1 = Venue.new(:name => "Braybrook Venue 1", :address => "blah", :comments => "some comments", :location => @braybrook, :sheltered => false)
    @braybrook_venue1.save

    @braybrook_venue2 = Venue.new(:name => "Braybrook Venue 2", :address => "blah", :comments => "some comments", :location => @braybrook, :sheltered => true)
    @braybrook_venue2.save

    @sunshine = Location.new(:name => "Sunshine", :weather_location => "Sunshine, Victoria")
    @sunshine.save
    
  end

  it 'should have venues' do
    search = Search.new
    search.find_venue :location_id => @braybrook.location_id, :sheltered => false
    venue = search.venue
    venue.should_not be_nil
    venue.location.name.should eq "Braybrook"
  end

  it 'should have no venues' do
    search = Search.new
    search.find_venue :location_id => @sunshine.location_id, :sheltered => false
    venue = search.venue
    venue.should be nil
  end

  it 'should return sheltered when need shelter' do
    google_weather = mock(GoogleWeather)
    google_weather.stub!(:current_conditions.condition).and_return("rain")

    search = Search.new
    search.find_venue :location_id => @braybrook.location_id, :sheltered => true
    venue = search.venue
    venue.should_not be_nil
    venue.location.sheltered.should eq true

  end

end
