class SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    cookies[:sign_in] = "Sign in info you want to store"
    super
  end

  # GET /resource/sign_out
  def destroy
    cookies[:sign_out] = "Sign out info you want to store"
    super
  end
end