class UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy]
  before_action :authenticate_user! 
  before_action :require_same_user, only: %i[destroy]

  def show; end

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = 'Account and all associated tweets successfully deleted.'
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    return unless current_user != @user && !current_user.admin?

    flash[:alert] = 'You can only edit or delete your own account.'
    redirect_to @user
  end
end