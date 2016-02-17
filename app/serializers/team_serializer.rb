class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :score
  belongs_to :game
end
