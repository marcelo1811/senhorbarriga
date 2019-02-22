class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_home, only: [:show, :destroy, :edit, :update]

  def index
    @homes = policy_scope(Home).order(created_at: :desc)

    @mark_homes = Home.where.not(latitude: nil, longitude: nil)

    @markers = @mark_homes.map do |home|
      {
        lng: home.longitude,
        lat: home.latitude,
        infoWindow: home.address,
        home_description: home.description,
        home_link: home_path(home),
        home: true
      }
    end

    location = params[:location]
    if location.nil? == false && location != ""
      if Geocoder.search(location).first.nil? == false
        lat = Geocoder.search(location).first.boundingbox[0].to_f
        lng = Geocoder.search(location).first.boundingbox[2].to_f
        @markers << { lng: lng, lat: lat, home: false }
      end
    end
  end

  def show
  end

  def destroy
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
  end

  def update
    @home.update(home_params)
    redirect_to home_path(@home)
  end

  private

  def set_home
    @home = Home.find(params[:id])
    authorize @home
  end

  def home_params
    params.require(:home).permit(:address, :description, :title, :price, :cep, :city, :photo, :location)
  end
end
