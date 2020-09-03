class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :destroy]

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to root_path
  end

  private

  def game_params
    params.require(:game).permit(:rounds, :max_player_count)
  end

end
