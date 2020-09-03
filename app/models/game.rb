class Game < ApplicationRecord
  belongs_to :user
  validates :rounds, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9, only_integer: true }
  validates :max_player_count, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 4, only_integer: true }
end
