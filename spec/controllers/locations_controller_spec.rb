require 'spec_helper'

describe LocationsController do
  before(:each) do
    activate_authlogic
    user = User.create! :login=>"pugnusferreus", :password=>"foobar", :password_confirmation=>"foobar"
    UserSession.create user

    #@location = Location.create! :name => "Location 1", :weather_location => "Braybrook, Victoria"

  end

  it 'should show a list of locations' do
    get :index
    should respond_with(:success)
    #response.should render_template("path/to/template/for/action")
  end
end
