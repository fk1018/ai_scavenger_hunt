class Game < ApplicationRecord
  has_secure_token :uuid

  has_many :players, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :submissions, through: :players
end
