class UsersController < ApplicationController
  before_action :ensure_signed_in, only: [:show]
  
  def new
    render :new
  end

  def show
    render :show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in!(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
