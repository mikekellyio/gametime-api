class GameBroadcastJob < ApplicationJob
  queue_as :default

  def perform(game)
    ActionCable.server.broadcast 'game_channel', message: game.to_json
  end
end
