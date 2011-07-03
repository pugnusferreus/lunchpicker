require 'spec_helper'

describe Search do
  before(:each) do
    @braybrook = Location.create! :name => "Braybrook", :weather_location => "Braybrook, Victoria"
    @braybrook_venue1 = Venue.create! :name => "Braybrook Venue 1", :address => "blah", :comments => "some comments", :location => @braybrook, :sheltered => false
    @braybrook_venue2 = Venue.create! :name => "Braybrook Venue 2", :address => "blah", :comments => "some comments", :location => @braybrook, :sheltered => true
    @sunshine = Location.create! :name => "Sunshine", :weather_location => "Sunshine, Victoria"
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

  it 'should return sheltered when rain' do
    data = {"current_conditions"=>{"condition"=>{"data"=>"Rain"}}}
    GoogleWeather.any_instance.expects(:weather).times(2).returns(data)

    search = Search.new
    search.find_venue :location_id => @braybrook.location_id, :sheltered => true
    venue = search.venue
    venue.should_not be_nil
    venue.sheltered.should eq true

  end

  it 'should return sheltered when storm' do
    data = {"current_conditions"=>{"condition"=>{"data"=>"Storm"}}}
    GoogleWeather.any_instance.expects(:weather).times(2).returns(data)

    search = Search.new
    search.find_venue :location_id => @braybrook.location_id, :sheltered => true
    venue = search.venue
    venue.should_not be_nil
    venue.sheltered.should eq true

  end

  it 'should return sheltered when thunderstorm' do
    data = {"current_conditions"=>{"condition"=>{"data"=>"Thunderstorm"}}}
    GoogleWeather.any_instance.expects(:weather).times(2).returns(data)

    search = Search.new
    search.find_venue :location_id => @braybrook.location_id, :sheltered => true
    venue = search.venue
    venue.should_not be_nil
    venue.sheltered.should eq true

  end

  it 'should return sheltered when snow' do
    data = {"current_conditions"=>{"condition"=>{"data"=>"Snow"}}}
    GoogleWeather.any_instance.expects(:weather).times(2).returns(data)

    search = Search.new
    search.find_venue :location_id => @braybrook.location_id, :sheltered => true
    venue = search.venue
    venue.should_not be_nil
    venue.sheltered.should eq true
  end
end
