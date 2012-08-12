class WelcomeController < ApplicationController  
  def index
  end

  def comment
    redirect_to(:action => :index, :comment_val => params["comment_val"])
  end
end
