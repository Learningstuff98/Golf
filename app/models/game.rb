class Game < ApplicationRecord
  belongs_to :user
  has_many :game_tokens
  has_many :players
  validates :rounds, numericality: {
    message: "Invalid",
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 9,
    only_integer: true
  }
  validates :max_player_count, numericality: {
    message: "Invalid",
    greater_than_or_equal_to: 2,
    less_than_or_equal_to: 4,
    only_integer: true
  }

  def already_player?(current_user)
    self.players.each do |player|
      if player.user_id == current_user.id
        return true
      end
    end
    return false
  end

end
