require 'spec_helper'

describe Search do
  before(:each) do
    @location = Location.new(:name => "Location 1", :weather_location => "Braybrook, Victoria")
    @location.save
  end

  it 'should have tests' do
    p Location.all
    pending
  end
end