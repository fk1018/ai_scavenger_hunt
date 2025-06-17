class Game < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :submissions, through: :players
end
