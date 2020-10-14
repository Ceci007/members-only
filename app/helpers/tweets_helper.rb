module TweetsHelper
  def anonymous_user?(tweet)
    user_signed_in? && (current_user.id == tweet.user_id || current_user.members_only? || current_user.admin?)
  end

  def current_user_signed_in?(tweet)
    user_signed_in? && current_user.id == tweet.user_id
  end
end
