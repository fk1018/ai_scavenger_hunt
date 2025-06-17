class Submission < ApplicationRecord
  belongs_to :player
  belongs_to :item
  after_create_commit -> { GameChannel.broadcast_to(item.game, type: "submission", submission: as_json) }
end
