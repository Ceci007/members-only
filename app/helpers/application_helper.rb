module ApplicationHelper
  def signed_in?
    if user_signed_in?
      render 'layouts/navigation_signin'
    else
      render 'layouts/navigation_signout'
    end
  end
end
