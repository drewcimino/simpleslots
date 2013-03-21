class GamesController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :set_user
  
  # def index
  #   @games = Game.all
  # end

  def show
    @user = current_user
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new
    @game.user = current_user
    if @game.save
      redirect_to game_path(@game)
    else
      flash[:alert] = "Whoops, something went wrong. Try again!"
      redirect_to :controller => 'users', :action => 'show', :id => current_user.id
    end
  end
  
  def update
    puts params
    @game = Game.find(params[:id])
    @game.play(params[:wager].to_i) if params[:wager]
    puts '---'
    puts @game.to_yaml
    puts '---'
    render :json => @game
  end

  def set_user
    @user = current_user
  end
  
end
