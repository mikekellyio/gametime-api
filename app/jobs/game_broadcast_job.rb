class GameBroadcastJob < ApplicationJob
  queue_as :default

  def perform(game)
    logger.info "game_channel_#{game.id}: #{GameSerializer.new(game).to_json}"
    ActionCable.server.broadcast 'game_channel_#{game.id}', message: GameSerializer.new(game).to_json
  end
end
