class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  
  before_filter :authenticate_user!
  before_filter :set_user
  
  def index
    @games = Game.all

  end

  def show
    @game = Game.find(params[:id])
  end

  def new

  end

  def edit
    @game = Game.find(params[:id])
  end

  def create

  end

  def update
    @game = Game.find(params[:id])
    if params[:action] = 'play'
      @game.play(params[:wager])
    end
  end

  def set_user
    @user = current_user
  end
  
end
