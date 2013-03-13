class UsersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    if !params[:id]
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end
  
  def edit
    @user = current_user
  end

end
