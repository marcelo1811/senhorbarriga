class UsersController < ApplicationController
  def show
    @user = current_user
    # @home = current_user.homes
  end
end
