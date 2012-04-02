class ClimbingsController < ApplicationController
  def new
    @climbing = Climbing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @climbing }
    end
  end
end
