class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :password

  has_many :teams
end
