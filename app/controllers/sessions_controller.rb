class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
      )

    if @user
      sign_in!(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def destroy
    sign_out!
    redirect_to new_user_url
  end

end
