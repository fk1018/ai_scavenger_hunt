class Item < ApplicationRecord
  belongs_to :game
  has_many :submissions, dependent: :destroy
  after_create_commit -> { GameChannel.broadcast_to(game, type: "new_item", item: as_json) }
end
