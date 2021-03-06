class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.xml
  def index
    if !check_session
      redirect_to root_path
      return
    end
    @locations = Location.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    if !check_session
      redirect_to root_path
      return
    end
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    if !check_session
      redirect_to root_path
      return
    end
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/1/edit
  def edit
    if !check_session
      redirect_to root_path
      return
    end
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.xml
  def create
    if !check_session
      redirect_to root_path
      return
    end
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        flash[:notice] = 'Location was successfully created.'
        format.html { redirect_to(@location) }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    if !check_session
      redirect_to root_path
      return
    end
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        flash[:notice] = 'Location was successfully updated.'
        format.html { redirect_to(@location) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    if !check_session
      redirect_to root_path
      return
    end
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end

  def weather_info
    @location_name = params[:loc]
    @weather = GoogleWeather.new(@location_name)
    @current_conditions = @weather.current_conditions if @weather.weather.key?('current_conditions')

    render :layout => false
  end

  def check_session
    if current_user.nil?
      return false
    else
      return true
    end
  end
end
