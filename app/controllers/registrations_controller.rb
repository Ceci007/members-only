class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :reset_password_sent_at, :remember_created_at)
  end

  def acount_update_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password, :reset_password_sent_at, :remember_created_at)
  end
end