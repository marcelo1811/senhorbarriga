class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @my_homes = Home.where(owner_id: @user.id)
  end
end
