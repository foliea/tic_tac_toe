require 'spec_helper'
require 'board'

describe Board do
  let(:board)              { Board.new(3) }
  let(:x_symbol)           { Params::X_SYMBOL }
  let(:o_symbol)           { Params::O_SYMBOL }
  let(:board_total_size)   { board.size**2 }

  it 'must have a size' do
    expect(board.size).to_not be_nil
  end

  it 'creates squares' do
    expect(board.to_a.size).to eq(board_total_size)
  end

  it 'must not allow outside move' do
    expect(board.move_available?(-1)).to be_false
  end

  it 'must not move on non empty square' do
    board.set('X........')
    expect(board.move_available?(0)).to be_false
    expect(board.move(0, x_symbol)).to be_nil
  end

  it 'must undo move' do
    board.set('X........')
    board.undo_move(0)
    expect(board.move_available?(0)).to be_true
  end

  it 'moves on empty square' do
    expect(board.move(0, x_symbol)).to_not be_nil
  end

  it 'resets' do
    board.reset
    expect(board.empty_squares.size).to eq(board_total_size)
  end

  it 'decreases empty squares' do
    board.set('X........')
    expect(board.empty_squares.size).to be < board_total_size
  end

  it 'detects draw' do
    board.set('XOX
               XOX
               OXO')
    expect(board).to be_draw
  end

  it 'detects if a game is over' do
    board.set('XOX
               XOX
               OXO')
    expect(board).to be_over
  end

  it 'finds if square has symbol' do
    board.set('X........')
    expect(board.square_has_symbol?(0, x_symbol)).to be_true
  end

  it 'detects when a player win on a row' do
    board.set('XXX......')
    expect(board.win?(x_symbol)).to be_true
  end

  it 'detects when a player win on a column' do
    board.set('X..
               X..
               X..')
    expect(board.win?(x_symbol)).to be_true
  end

  it 'detects when a player win on a diagonale' do
    board.set('X..
               .X.
               ..X')
    expect(board.win?(x_symbol)).to be_true
  end

  it 'must be convertible to an array' do
    expect(board.to_a.class).to eq(Array)
  end

end
