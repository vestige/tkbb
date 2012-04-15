class ClimbingsController < ApplicationController
  def index
    @climbings = Climbing.with_user
  end
  
  def new
    @climbing = Climbing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @climbing }
    end
  end

  def create
    @climbing = Climbing.new(params[:climbing])
    @climbing.user = current_user

    if @climbing.save
      redirect_to climbings_path 
    else
      render :new
    end
  end
end
