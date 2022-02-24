class User1sController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]  
  def show
    @user = User.find(params[:id]) #追記
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :profile)
  end
end
