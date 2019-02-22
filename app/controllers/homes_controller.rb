class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_home, only: [:show, :destroy, :edit, :update]

  def filter?(location, max_dist)
    return false if location.nil? || location == ""

    return false if max_dist.nil? || max_dist.zero?

    true
  end

  def index
    @homes = policy_scope(Home).order(created_at: :desc)

    max_dist = params[:max_dist].to_i
    max_dist = 1_000_000 if max_dist.to_i.zero?
    location = params[:location]

    if location.nil? || location == ""
      lat = request.location.latitude.to_f
      lng = request.location.longitude.to_f
    elsif Geocoder.search(location).first.nil? == false
      lat = Geocoder.search(location).first.boundingbox[0].to_f
      lng = Geocoder.search(location).first.boundingbox[2].to_f
    end

    coordinates_hash = { lng: lng, lat: lat, home: false }
    coordinates_array = [lat, lng]

    @mark_homes = Home.where.not(latitude: nil, longitude: nil).near(coordinates_array, max_dist)

    @markers = @mark_homes.map do |home|
      {
        lng: home.longitude,
        lat: home.latitude,
        infoWindow: home.address,
        home_description: home.description,
        home_address: home.address,
        home_title: home.title,
        home_link: home_path(home),
        home_photo: home.photo.url,
        home_price: home.price,
        home: true
      }
    end

    if location.nil? || location == ""
      @markers << { lng: request.location.longitude.to_f, lat: request.location.latitude.to_f, home: false }
    elsif Geocoder.search(location).first.nil? == false
      @markers << coordinates_hash
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
    params.require(:home).permit(:address, :description, :title, :price, :cep, :city, :photo, :location, :max_dist)
  end
end
