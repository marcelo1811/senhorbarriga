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
    # student creates a listing by clicking like. The home owner will set like to TRUE when he ALSO likes
    if @listing.valid?
      @listing.save
      redirect_to home_path(@listing.home_id)
    else
      redirect_to homes_path
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:student_id, :home_id, :like)
  end
end
