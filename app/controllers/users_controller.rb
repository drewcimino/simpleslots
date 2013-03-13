class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user unless params[:id]
    @user = User.find(params[:id])
  end

end
