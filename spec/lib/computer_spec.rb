require 'spec_helper'

describe Computer do
  let(:board)  { Board.new }
  let(:computer) { Computer.new(Board::X_SYMBOL) }

  it 'should have symbol' do
    expect(computer.symbol).to_not be_nil
  end

  it 'should find ennemy symbol' do
    expect(computer.send(:find_ennemy_symbol)).to eq(Board::O_SYMBOL)
  end

  it 'should move after finding location' do
    computer.stubs(:find_ennemy_symbol).returns(Board::O_SYMBOL)
    computer.stubs(:find_next_location).returns(1)
    expect(computer.move(board, nil)).to_not be_nil
  end
end
