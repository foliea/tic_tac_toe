require 'spec_helper'
require 'board'

describe Board do
  let(:board)              { Board.new(3) }
  let(:x_symbol)           { Params::X_SYMBOL }
  let(:o_symbol)           { Params::O_SYMBOL }
  let(:board_total_size)   { board.size ** 2 }

  it 'should have a size' do
    expect(board.size).to_not be_nil
  end

  it 'should create squares' do
    expect(board.to_a.size).to eq(board_total_size)
  end

  it "shouldn't allow outside move" do
    expect(board.move_available?(-1)).to be_false
  end

  it "souldn't move on non empty square" do
    board.set('X........')
    expect(board.move_available?(0)).to be_false
    expect(board.move(0, x_symbol)).to be_nil
  end

  it 'should undo move' do
    board.set('X........')
    board.undo_move(0)
    expect(board.move_available?(0)).to be_true
  end

  it 'should move on empty square' do
    expect(board.move(0, x_symbol)).to_not be_nil
  end

  it 'should reset' do
    board.reset
    expect(board.empty_squares.size).to eq(board_total_size)
  end

  it 'should decrease empty squares' do
    board.set('X........')
    expect(board.empty_squares.size).to be < board_total_size
  end

  it 'should detect draw' do
    board.set('XOX
               XOX
               OXO')
    expect(board).to be_draw
  end
	
	it 'should detect if a game is over' do
    board.set('XOX
               XOX
               OXO')
    expect(board.over?).to be_true
  end

  it 'should find if square has symbol' do
    board.set('X........')
    expect(board.square_has_symbol?(0, x_symbol)).to be_true
  end

  it 'should detect when a player win on a row' do
    board.set('XXX......')
    expect(board.win?(x_symbol)).to be_true
  end

  it 'should detect when a player win on a column' do
    board.set('X..
               X..
               X..')
    expect(board.win?(x_symbol)).to be_true
  end

  it 'should detect when a player win on a diagonale' do
    board.set('X..
               .X.
               ..X')
    expect(board.win?(x_symbol)).to be_true
  end

	it 'should be representable as an array' do
		expect(board.to_a.class).to eq(Array) 
	end
end
