class GymsController < ApplicationController
  def index
    if params[:query].present?
      @gyms = Gym.search(params[:query])
    else
      @gyms = Gym.all
    end

    render :index
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def new
    @gym = Gym.new
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def create
    @gym = Gym.new(params[:gym])

    if @gym.save
      redirect_to(@gym, :notice => t('gyms_controller.create.success'))
    else
      render :action => "new"
    end
  end

  def update
    @gym = Gym.find(params[:id])

    if @gym.update_attributes(params[:gym])
      redirect_to(@gym, :notice => t('gyms_controller.update.success'))
    else
      render :action => "edit"
    end
  end

  def destroy
    @gym = Gym.find(params[:id])
    @gym.destroy

    redirect_to(gyms_url)
  end
end
