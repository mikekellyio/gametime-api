class Game < ApplicationRecord
  has_many :teams,
        -> {order(:id)}

  after_update_commit {
    logger.debug "updated game #{self.id}"
    GameBroadcastJob.perform_later self
  }
  before_create :build_teams

  scope :autocomplete, ->(q) { where("games.name like ?", "#{q}%")}

  protected
  def build_teams
    ["Blue", "Green", "Red", "Yellow"].each do |name|
      teams << Team.new(name: name, score: 0)
    end
  end
end
