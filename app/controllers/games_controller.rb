class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :destroy]

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    if @game.valid?
      @game.game_tokens.create(host_username: @game.user.username)
      SendTokenJob.perform_later(Array(GameToken.all))
      return redirect_to game_path(@game)
    end
    render :new, status: :unprocessable_entity
  end

  def show
    @game = current_game
    if @game.players.count < @game.max_player_count
      if !@game.already_player?(current_user)
        @game.players.create(
          user_id: current_user.id,
          username: current_user.username
        )
      end
    end
  end

  def destroy
    current_game.game_tokens.destroy_all
    SendTokenJob.perform_later(Array(GameToken.all))
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
