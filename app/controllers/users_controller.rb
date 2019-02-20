class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @my_homes = Home.where(owner_id: @user.id)
    @my_listings = []
    Listing.all.each do |listing|
      if listing.home.owner_id == @user.id
        home = Home.find(listing.home_id)
        student = User.find(listing.student_id)
        @my_listings << { listing: listing, home: home, student: student }
      end
    end
  end
end
