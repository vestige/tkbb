class ClimbingsController < ApplicationController
  def index
    @climbings = Climbing.includes(:user).all
  end
  
  def new
    @climbing = Climbing.new
  end

  def tweet
    Twitter.configure do |config|
      config.consumer_key = ENV["ARM_TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["ARM_TWITTER_CONSUMER_SECRET"]
      config.oauth_token = current_user.token
      config.oauth_token_secret = current_user.secret
    end

    message = "#tkbb #" + @climbing.action + " #" + @climbing.gym.name + " " + @climbing.comment

    Twitter.update(message) if Rails.env.production?
    Rails.logger.info("Post to Twitter: " + message)
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
