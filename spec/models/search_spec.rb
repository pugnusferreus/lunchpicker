require 'spec_helper'

describe Search do
  before(:each) do
    @braybrook = Location.create! :name => "Braybrook", :weather_location => "Braybrook, Victoria"
    @braybrook_venue1 = Venue.create! :name => "Braybrook Venue 1", :address => "blah", :comments => "some comments", :location => @braybrook, :sheltered => false
    @braybrook_venue2 = Venue.create! :name => "Braybrook Venue 2", :address => "blah", :comments => "some comments", :location => @braybrook, :sheltered => true
    @sunshine = Location.create! :name => "Sunshine", :weather_location => "Sunshine, Victoria"
  end

  it 'should have have venues' do
    p Venue.all
    @search = Search.new
    @search.find_venue :location_id => @braybrook.location_id, :sheltered => false
    venue = @search.venue
    p venue
    venue.should_not be_nil
    venue.location.name.should eq "Braybrook"
  end

  #it 'should have no venues' do
  #  search = Search.new
  #  search.find_venue :location_id => @sunshine.location_id, :sheltered => false
  #  venue = search.venue
  #  p venue
  #  venue.should be nil
  #end
end
