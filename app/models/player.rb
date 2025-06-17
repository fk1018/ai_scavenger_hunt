class Player < ApplicationRecord
  belongs_to :game
  has_many :submissions, dependent: :destroy
end
