module TweetsHelper
  def anonymous_user?(tweet)
    if user_signed_in? && (current_user.id == tweet.user_id || current_user.members_only? || current_user.admin?)
      render partial: 'tweets/tweet_gravatar', locals: { tweet: tweet }
    else
      render 'tweets/tweet_image'
    end
  end

  def anonymous_user_names(tweet)
    unless user_signed_in? && (current_user.id == tweet.user_id || current_user.members_only? || current_user.admin?)
      return
    end

    render partial: 'tweets/tweet_username', locals: { tweet: tweet }
  end

  def process_tweet(tweet)
    return unless user_signed_in? && current_user.id == tweet.user_id

    render partial: 'tweets/process_tweet', locals: { tweet: tweet }
  end

  def user_is_signed_in_column
    if user_signed_in?
      render 'tweets/profile'
    else
      render 'tweets/trends'
    end
  end

  def article_tweet_form
    render 'tweets/article_tweet' if user_signed_in?
  end
end
