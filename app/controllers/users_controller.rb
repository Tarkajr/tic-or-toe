class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to '/login'
  end

  def show
    @user = User.find(current_user.id)

  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end

end
