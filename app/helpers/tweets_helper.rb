module TweetsHelper
  def anonymous_user?(tweet)
    if user_signed_in? && (current_user.id == tweet.user_id || current_user.members_only? || current_user.admin?)
      render :partial => 'tweets/tweet_gravatar', :locals => {:tweet => tweet} 
    else
      render 'tweets/tweet_image'
    end
  end

  def anonymous_user_names(tweet)
    if user_signed_in? && (current_user.id == tweet.user_id || current_user.members_only? || current_user.admin?)
      render :partial => 'tweets/tweet_username', :locals => {:tweet => tweet} 
    end
  end

  def process_tweet(tweet)
    if user_signed_in? && current_user.id == tweet.user_id
      render :partial => 'tweets/process_tweet', :locals => {:tweet => tweet}  
    end
  end

  def user_is_signed_in_column
    if user_signed_in?
      render 'tweets/profile'
    else
      render 'tweets/trends'
    end
  end

  def article_tweet_form 
    if user_signed_in? 
      render 'tweets/article_tweet'
    end
  end
end
