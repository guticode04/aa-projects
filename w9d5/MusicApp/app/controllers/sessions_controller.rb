class SessionsController < ApplicationController


  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = "Wrong email/password combo. Please try again."
      render :new
    else
      log_in_user!(user)
      redirec_to user_url
    end

  end


  def destroy
    logout_user!
    redirec_to new_session_url
  end


end