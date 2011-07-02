require 'spec_helper'

describe LocationsController do
  before(:each) do
    activate_authlogic
    user = User.create! :login=>"pugnusferreus"
    UserSession.create user
  end

  it 'should show a list of locations' do
    p Location.all
  end
end
