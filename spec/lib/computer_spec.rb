require 'spec_helper'

describe Computer do
  let(:x_symbol)     { Board::X_SYMBOL }
  let(:o_symbol)     { Board::O_SYMBOL }
  let(:blank_symbol) { Board::BLANK_SYMBOL }
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
    expect(computer.move(board, nil)).to_not be_nil
  end

  it 'should find winning location' do
    board.move(0, x_symbol)
    board.move(1, x_symbol)
    expect(computer.find_next_location(board, o_symbol)).to eq(2)
  end

  it 'should counter ennemy winning location' do
    board.move(0, o_symbol)
    board.move(1, o_symbol)
    expect(computer.find_next_location(board, o_symbol)).to eq(2)
  end

  it 'should fork' do
    board.move(1, x_symbol)
    board.move(5, x_symbol)
    expect(computer.find_next_location(board, o_symbol)).to eq(2)
  end

  it 'should counter ennemy fork' do
    board.move(1, o_symbol)
    board.move(5, o_symbol)
    expect(computer.find_next_location(board, o_symbol)).to eq(2)
  end

  it 'should take center' do
    expect(computer.find_next_location(board, o_symbol)).to eq(4)
  end

  it 'should take opposite corner' do
    board.move(4, x_symbol)
    board.move(0, o_symbol)
    expect(computer.find_next_location(board, o_symbol)).to eq(8)
  end

  it 'should take empty square' do
    [ x_symbol, o_symbol, x_symbol,
      blank_symbol, o_symbol, x_symbol,
      o_symbol, x_symbol, o_symbol].each.with_index do |symbol, index|
      board.move(index, symbol)
    end
    expect(computer.find_next_location(board, o_symbol)).to eq(3)
  end
end
