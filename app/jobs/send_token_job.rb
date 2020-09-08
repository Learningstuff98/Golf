class SendTokenJob < ApplicationJob
  queue_as :default

  def perform(game_token)
    ActionCable.server.broadcast("lobby_channel", game_token: game_token) 
  end
end
