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

  def tweet
    Twitter.configure do |config|
      config.consumer_key = ENV["ARM_TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["ARM_TWITTER_CONSUMER_SECRET"]
      config.oauth_token = current_user.token
      config.oauth_token_secret = current_user.secret
    end

    message = "#tkbb #" + @climbing.action + " #" + @climbing.gym.name + " " + @climbing.comment
    if Rails.env.production?
      Twitter.update(message)
    else
      p message
    end
  end
  
  def create
    @climbing = Climbing.new(params[:climbing])
    @climbing.user = current_user

    if @climbing.save
      tweet
      redirect_to climbings_path 
    else
      render :new
    end
  end
end
