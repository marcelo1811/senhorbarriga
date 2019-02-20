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
    @home = Home.find(params[:home_id])

    # student creates a listing by clicking like. The home owner will set like to TRUE when he ALSO likes
    if @home.listing.where(home_id: @home.id, student_id: current_user.id).size.zero?
      @listing.save
      redirect_to home_path(@home.id)
    else
      listing = Listing.where(home_id: @listing.home_id, student_id: @listing.student_id).first
      listing.student_like = !listing.student_like
      listing.save
      redirect_to root_path
    end
  end

  def owner_like
    @listing = Listing.find(params[:format])
    authorize @listing
    @listing.owner_like = !@listing.owner_like
    @listing.save
    redirect_to root_path
  end

  # def destroy
  #   @home.destroy
  #   redirect_to homes_path
  # end

  private

  def listing_params
    params.require(:listing).permit(:student_id, :home_id, :like)
  end
end
