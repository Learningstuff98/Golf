class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:lobby]

  def home
  end

  def lobby
    @game_tokens = GameToken.all
  end

end
