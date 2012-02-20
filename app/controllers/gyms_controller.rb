class GymsController < ApplicationController
  def search
    # @gyms = Gym
    if params[:query].present?
      @gyms = Gym.search(params[:query]) 
    else
      @gyms = Gym.all
    end

    render :index
  end
  
  # GET /gyms
  # GET /gyms.xml
  def index
    @gyms = Gym.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gyms }
    end
  end

  # GET /gyms/1
  # GET /gyms/1.xml
  def show
    @gym = Gym.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gym }
    end
  end

  # GET /gyms/new
  # GET /gyms/new.xml
  def new
    @gym = Gym.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gym }
    end
  end

  # GET /gyms/1/edit
  def edit
    @gym = Gym.find(params[:id])
  end

  # POST /gyms
  # POST /gyms.xml
  def create
    @gym = Gym.new(params[:gym])

    respond_to do |format|
      if @gym.save
        format.html { redirect_to(@gym, :notice => 'Gym was successfully created.') }
        format.xml  { render :xml => @gym, :status => :created, :location => @gym }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gym.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gyms/1
  # PUT /gyms/1.xml
  def update
    @gym = Gym.find(params[:id])

    respond_to do |format|
      if @gym.update_attributes(params[:gym])
        format.html { redirect_to(@gym, :notice => 'Gym was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gym.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gyms/1
  # DELETE /gyms/1.xml
  def destroy
    @gym = Gym.find(params[:id])
    @gym.destroy

    respond_to do |format|
      format.html { redirect_to(gyms_url) }
      format.xml  { head :ok }
    end
  end
end
