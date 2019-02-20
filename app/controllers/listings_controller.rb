class ListingsController < ApplicationController
  #  def new
  #   @listing = Listing.new
  #   authorize @listing
  # end

  def create
    @listing = Listing.new
    authorize @listing
    @listing.home_id = params[:home_id].to_i
    @listing.student_id = current_user.id
    @listing.like = false
    @home = Home.find(params[:home_id])

    # student creates a listing by clicking like. The home owner will set like to TRUE when he ALSO likes
    if @home.listing.where(home_id: @home.id).size.zero?
      @listing.save
      redirect_to home_path(@home.id)
    else
      @listing.destroy
      # raise
      raise
      redirect_to homes_path
    end
  end

  def like
    @listing = Listing.find(params[:format])
    authorize @listing
    @listing.like = !@listing.like
    @listing.save
    redirect_to root_path
  end

  private

  def listing_params
    params.require(:listing).permit(:student_id, :home_id, :like)
  end
end
