require 'spec_helper'

describe LocationsController do
  before do
    activate_authlogic
    user = User.create! :login=>"pugnusferreus", :password=>"foobar", :password_confirmation=>"foobar"
    UserSession.create user

  end

  it 'should show a list of locations' do
    get :index
    should respond_with(:success)
  end

  it 'should show new location' do
    get :new
    should respond_with(:success)
  end

  it 'should show a location by id' do
    location = Location.create! :name => "Location 1", :weather_location => "Braybrook, Victoria"
    get :show, :id=>location.id
    should respond_with(:success)
  end

  it 'should show edit location' do
    location = Location.create! :name => "Location 1", :weather_location => "Braybrook, Victoria"
    get :edit, :id=>location.id
    should respond_with(:success)
  end

  it 'should create a location' do
    post :create, :location=>{:name=>"test create",:weather_location =>"Braybrook, Victoria"}
    location = Location.where(:name=>"test create").first
    location.name.should eql "test create"
    response.should redirect_to(location)
  end

  it 'should update a location' do
    location = Location.create! :name => "test update", :weather_location => "Braybrook, Victoria"
    post :update, :id=>location.id,:location=>{:name=>"New test update",:weather_location=>"Braybrook, Victoria"}
    location = Location.where(:name=>"New test update").first
    location.name.should eql "New test update"
    response.should redirect_to(location)
  end

  it 'should destroy a location' do
    location = Location.create! :name => "test delete", :weather_location => "Braybrook, Victoria"
    get :destroy, :id=>location.id
    response.should redirect_to(Location)
  end
end
