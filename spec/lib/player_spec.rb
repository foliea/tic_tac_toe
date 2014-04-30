require 'spec_helper'

describe Player do
  let(:player) { Player.new(Parameters::X_SYMBOL) }
  let(:board)  { Board.new }

  it 'should have symbol' do
    expect(player.symbol).to_not be_nil
  end

  it 'should move' do
    expect(player.move(board, 0)).to_not be_nil
  end

end
