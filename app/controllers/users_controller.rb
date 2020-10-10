class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :authenticate_user! #, except: %i[index show]

  def show; end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end