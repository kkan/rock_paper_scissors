require 'rock_paper_scissors/game_play'

RSpec.describe RockPaperScissors::GamePlay do
  it 'returns game with generated second sign and result' do
    game = RockPaperScissors::GamePlay.play(:scissors)
    expect(game.sign1).to eq :scissors
    expect([:scissors, :rock, :paper].include?(game.sign2)).to eq true
    expect([:win, :loss, :tie].include?(game.result)).to eq true
  end
end
