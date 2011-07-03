require 'spec_helper'

describe Venue do
  before do
    @location =  Location.create! :name => "Location", :weather_location => "Braybrook, Victoria"
  end

  it 'should create venue' do
    venue = Venue.create! :name => "Venue 1", :address => "blah", :comments => "some comments", :location => @location, :sheltered => false
    venue = Venue.find(venue.id)
    venue.name.should eql "Venue 1"
    venue.address.should eql "blah"
    venue.comments.should eql "some comments"
    venue.location.should eql @location
    venue.sheltered.should eql false
  end

  it 'should update venue' do
    venue = Venue.create! :name => "Venue 1", :address => "blah", :comments => "some comments", :location => @location, :sheltered => false
    venue = Venue.find(venue.id)

    venue.name = "Venue 2"
    venue.address = "New Address"
    venue.comments = "new comment"
    venue.sheltered = true
    venue.save!

    venue = Venue.find(venue.id)
    venue.name.should eql "Venue 2"
    venue.address.should eql "New Address"
    venue.comments.should eql "new comment"
    venue.location.should eql @location
    venue.sheltered.should eql true
  end

  it 'should delete venue' do
    venue = Venue.create! :name => "Venue 1", :address => "blah", :comments => "some comments", :location => @location, :sheltered => false
    venue_id = venue.id
    venue.destroy
    lambda{ Venue.find(venue_id) }.should raise_error
  end
end
