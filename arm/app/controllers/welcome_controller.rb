class WelcomeController < ApplicationController  
  def index
    p "tkbb"
    p params[:comment_val]
  end

  def comment
    redirect_to(:action => :index, :comment_val => params["comment_val"])
  end
end
