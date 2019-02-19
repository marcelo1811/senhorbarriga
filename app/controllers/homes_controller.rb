class HomesController < ApplicationController
  def index
    @homes = Home.all
  end

  def show
    @home = Home.find(params[:id])
  end

  def destroy
    @home = Home.find(params[:id])
    @home.destroy
    redirect_to homes_path
  end
end
