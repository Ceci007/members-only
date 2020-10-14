module UsersHelper
  def user_admin_signed_in?(user)
    user_signed_in? && current_user.admin?
  end
end