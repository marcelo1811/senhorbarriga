class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @my_homes = Home.where(owner_id: @user.id)

    @my_listings = []
    Listing.all.where(student_like: true).each do |listing|
      if (listing.home.owner_id == @user.id)
        home = Home.find(listing.home_id)
        student = User.find(listing.student_id)
        @my_listings << { listing: listing, home: home, student: student, owner_like: listing.owner_like }
      end
    end

    @my_likes = []
    Listing.all.where(student_like: true).each do |listing|
      if (listing.student_id == @user.id)
        home = Home.find(listing.home_id)
        owner = User.find(listing.home.owner_id)
        @my_likes << { listing: listing, home: home, owner: owner, owner_like: listing.owner_like }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:photo, :description)
  end
end
