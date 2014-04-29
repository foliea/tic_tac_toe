require 'spec_helper'

describe Game do
  let(:game) { Game.new }
  
  it 'should have two players and a board'
  
  end
  
  it 'should be started to play' do
    expect(game.play).to eq(GameStatus::GAME_NOT_STARTED)  
  end
  
  it "should stop when it's over"
  
  end
end