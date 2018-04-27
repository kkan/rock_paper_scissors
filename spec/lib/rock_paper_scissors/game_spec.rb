require 'rock_paper_scissors/game_play'

RSpec.describe RockPaperScissors::Game do

  it 'returns signs' do
    expect(RockPaperScissors::Game.signs).to match_array [:rock, :paper, :scissors]
  end

  describe 'result' do
    it 'rock beats scissors' do
      expect(RockPaperScissors::Game.new(:rock, :scissors).result).to eq :win
    end

    it 'paper and paper is tie' do
      expect(RockPaperScissors::Game.new(:paper, :paper).result).to eq :tie
    end

    it 'paper looses to scissors' do
      expect(RockPaperScissors::Game.new(:paper, :scissors).result).to eq :loss
    end
  end

end
