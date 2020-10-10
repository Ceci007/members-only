class ApplicationController < ActionController::Base
  include Devise::Controllers::Rememberable

  def after_sign_in_remember_me(resource)
    remember_me resource
  end
end
