class VenuesController < ApplicationController
  layout 'default'
  # GET /venues
  # GET /venues.xml
  def index
    if !check_session
      redirect_to root_path
      return
    end
    
    @loc_id = params[:location_id]
    
    if (@loc_id.nil?) 
      @venues = Venue.find(:all,:conditions => ["location_id = null"])
    elsif (@loc_id == "")
      @venues = Venue.find(:all,:include=>[:location])
    else
      @venues = Venue.find(:all,:include=>[:location],:conditions=>{:location_id => @loc_id})
    end
    
    respond_to do |format|
      format.html # index.html.erb
     format.xml  { render :xml => @venues }
    end
     
  end

  # GET /venues/1
  # GET /venues/1.xml
  def show
    if !check_session
      redirect_to root_path
      return
    end
    @venue = Venue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @venue }
    end
  end

  # GET /venues/new
  # GET /venues/new.xml
  def new
    if !check_session
      redirect_to root_path
      return
    end
    @venue = Venue.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @venue }
    end
  end

  # GET /venues/1/edit
  def edit
    if !check_session
      redirect_to root_path
      return
    end
    @venue = Venue.find(params[:id])
  end

  # POST /venues
  # POST /venues.xml
  def create
    if !check_session
      redirect_to root_path
      return
    end 
    @venue = Venue.new(params[:venue])

    respond_to do |format|
      if @venue.save
        flash[:notice] = 'Venue was successfully created.'
        format.html { redirect_to(@venue) }
        format.xml  { render :xml => @venue, :status => :created, :location => @venue }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /venues/1
  # PUT /venues/1.xml
  def update
    if !check_session
      redirect_to root_path
      return
    end
    @venue = Venue.find(params[:id])

    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        flash[:notice] = 'Venue was successfully updated.'
        format.html { redirect_to(@venue) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.xml
  def destroy
    if !check_session
      redirect_to root_path
      return
    end
    
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to(venues_url)
    
    respond_to do |format|
      format.html { redirect_to(venues_url) }
      format.xml  { head :ok }
    end
  end
  
  def check_session
    if current_user.nil?
      return false
    else
      return true
    end
  end
  
end
