class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :destroy]

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    return redirect_to game_path(@game) if @game.valid?
    render :new, status: :unprocessable_entity
  end

  def show
    @game = current_game
  end

  def destroy
    current_game.destroy
    redirect_to root_path
  end

  private

  def current_game
    @game ||= Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:rounds, :max_player_count)
  end

end
