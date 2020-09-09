class SendPlayerJob < ApplicationJob
  queue_as :default

  def perform(players)
    ActionCable.server.broadcast("game_channel", players: players)
  end
end
