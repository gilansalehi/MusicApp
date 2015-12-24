class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username]
      params[:user][:password]
      )

    if @user
      sign_in!(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

end
