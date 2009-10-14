class LocationsController < ApplicationController
  layout 'default'
  # GET /locations
  # GET /locations.xml
  def index
    @locations = Location.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.xml
  def create
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
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end

  def weather_info
    weather_location = params[:loc].to_json
    @google_weather = GoogleWeather.new(weather_location)
    has_data = @google_weather.weather
 
    if(has_data.key? 'current_conditions') then
      img_path = $WEATHER_ICON_ROOT_PATH + @google_weather.current_conditions.icon
      info = <<-HTML
      <p>
        <img src="#{img_path}" alt="#{img_path}" />
        Condition : #{@google_weather.current_conditions.condition}
      </p>
      <p>
        Temperature (Celcius) : #{@google_weather.current_conditions.temp_c}
      </p>
      <p>
        Wind Condition : #{@google_weather.current_conditions.wind_condition}
      </p>
      <p>
        Humidity : #{@google_weather.current_conditions.humidity}
      </p>
      HTML
      render :text => info
    else
      render :text => "<p>Cannot find weather information for #{params[:loc]}</p>"
    end
  end
end
