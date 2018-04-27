require_relative 'game'

module RockPaperScissors
  class GamePlay
    def self.play(sign)
      Game.new(sign, Game.signs.sample)
    end
  end
end
