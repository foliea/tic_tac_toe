require 'spec_helper'

describe Computer do
  let(:x_symbol)     { Parameters::X_SYMBOL }
  let(:o_symbol)     { Parameters::O_SYMBOL }
  let(:blank_symbol) { Parameters::BLANK_SYMBOL }
  let(:board)        { Board.new }
  let(:computer)     { Computer.new(x_symbol) }

  it 'should have symbol' do
    expect(computer.symbol).to_not be_nil
  end

  it 'should find ennemy symbol' do
    expect(computer.send(:find_ennemy_symbol)).to eq(o_symbol)
  end

  it 'should move after finding ennemy symbol and location' do
    computer.stubs(:find_ennemy_symbol).returns(o_symbol)
    computer.stubs(:find_next_location).returns(1)
    expect(computer.move(board)).to_not be_nil
  end

  it 'should find winning location' do
    board.grid = [ x_symbol, x_symbol, blank_symbol ]
    expect(computer.find_next_location(board, o_symbol)).to eq(2)
  end

  it 'should counter ennemy winning location' do
    board.grid = [ o_symbol, o_symbol, blank_symbol ]
    expect(computer.find_next_location(board, o_symbol)).to eq(2)
  end

  it 'should fork' do
    board.grid = [ blank_symbol, x_symbol,     blank_symbol,
                   blank_symbol, blank_symbol, x_symbol,
                   blank_symbol, blank_symbol, blank_symbol ]
    expect(computer.find_next_location(board, o_symbol)).to eq(2)
  end

  it 'should counter ennemy fork' do
    board.grid = [ blank_symbol, o_symbol,     blank_symbol,
                   blank_symbol, blank_symbol, o_symbol,
                   blank_symbol, blank_symbol, blank_symbol ]
    expect(computer.find_next_location(board, o_symbol)).to eq(2)
  end

  it 'should take center' do
    expect(computer.find_next_location(board, o_symbol)).to eq(4)
  end

  it 'should take opposite corner' do
    board.grid = [ o_symbol,     blank_symbol, blank_symbol,
                   blank_symbol, x_symbol,     blank_symbol,
                   blank_symbol, blank_symbol, blank_symbol ]
    expect(computer.find_next_location(board, o_symbol)).to eq(8)
  end

  it 'should take empty square' do
    board.grid = [ x_symbol,     o_symbol, x_symbol,
                   blank_symbol, x_symbol, x_symbol,
                   o_symbol,     x_symbol, o_symbol ]
    expect(computer.find_next_location(board, o_symbol)).to eq(3)
  end
end
