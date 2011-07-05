require 'spec_helper'

describe VenuesController do
  before do
    activate_authlogic
    user = User.create! :login=>"pugnusferreus", :password=>"foobar", :password_confirmation=>"foobar"
    UserSession.create user

    @location = Location.create! :name=>"Location1", :weather_location=>"Braybrook, Victoria"
  end

  it 'should show a list of venues' do
    get :index, :location_id => @location.id
    should respond_with(:success)

    get :index, :location_id => ''
    should respond_with(:success)

    get :index, :location_id => nil
    should respond_with(:success)
  end

  it 'should show new venue' do
    get :new, :location_id => @location.id
    should respond_with(:success)
  end

  it 'should show a venue by id' do
    venue = Venue.create! :name => "Venue 1", :address => "blah", :comments => "some comments", :location => @location, :sheltered => false
    get :show, :id => venue.id
    should respond_with(:success)
  end

  it 'should show edit venue' do
    venue = Venue.create! :name => "Venue 1", :address => "blah", :comments => "some comments", :location => @location, :sheltered => false
    get :edit, :id => venue.id
  end

  it 'should create a venue' do
    post :create, :venue => { :name => "Test Create Venue", :address => "blah", :comments => "some test comments", :location => @location, :sheltered => false}
    venue = Venue.where( :name => "Test Create Venue" ).first
    venue.name.should eql "Test Create Venue"
    response.should redirect_to(venue_path(assigns(:venue)))
  end

  it 'should update a venue' do
    venue = Venue.create! :name => "Test Update Venue", :address => "blah", :comments => "some comments", :location => @location, :sheltered => false
    post :update, :id => venue.id, :venue => { :name => "New Test Update Venue" }
    venue = Venue.where( :venue_id => venue.id ).first
    venue.name.should eql "New Test Update Venue"
    venue.should redirect_to(venue)
  end

  it 'should destroy a venue' do
    venue = Venue.create! :name => "Test Delete Venue", :address => "blah", :comments => "some comments", :location => @location, :sheltered => false
    get :destroy, :id => venue.id
    response.should redirect_to(venues_url(:location_id=>@location))

  end
end
