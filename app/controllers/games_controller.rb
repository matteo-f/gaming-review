class GamesController < ApplicationController
  before_action :require_login

  def index
    @games = Game.order('lower(name)').all
  end

  def show
    @game = Game.find(params[:id])
  end

  def top_games
    @top_games = Game.top_games
  end
end
