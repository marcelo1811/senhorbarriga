class HomesController < ApplicationController
  def index
    @homes = policy_scope(Home).order(created_at: :desc)
  end

  def show
    @home = Home.find(params[:id])
    authorize @home
  end

  def destroy
    @home = Home.find(params[:id])
    authorize @home
    @home.destroy
    redirect_to homes_path
  end

  def new
    @home = Home.new
    authorize @home
  end

  def create
    @home = Home.new(home_params)
    authorize @home
    @home.owner = current_user
    if @home.valid?
      @home.save
      redirect_to home_path(@home)
    else
      render :new
    end
  end

  def edit
    @home = Home.find(params[:id])
    authorize @home
  end

  def update
    @home = Home.find(params[:id])
    authorize @home
    @home.update(home_params)
    redirect_to home_path(@home)
  end

  private

  def home_params
    params.require(:home).permit(:address, :bed, :description, :title)
  end
end
