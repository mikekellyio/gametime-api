class Game < ApplicationRecord
  has_many :teams

  after_update_commit { GameBroadcastJob.perform_later self }
end
