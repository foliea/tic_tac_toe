require 'spec_helper'

describe Computer do
  let(:x_symbol)     { Parameters::X_SYMBOL }
  let(:o_symbol)     { Parameters::O_SYMBOL }
  let(:blank_symbol) { Parameters::BLANK_SYMBOL }
  let(:board)        { Board.new(3) }
  let(:computer)     { Computer.new(x_symbol) }

  it 'should have symbol' do
    expect(computer.symbol).to_not be_nil
  end

  it 'should find opponent symbol' do
    expect(computer.opponent_symbol).to eq(o_symbol)
  end

  it 'should win' do
    board.grid = [ x_symbol, x_symbol,     blank_symbol,
                   o_symbol, blank_symbol, blank_symbol,
                   o_symbol, blank_symbol, blank_symbol ]
    best_move, best_score = computer.minimax(board, x_symbol, o_symbol)
    expect(best_move).to eq(2)
  end

  it 'should counter opponent' do
    board.grid = [ o_symbol,     o_symbol,     blank_symbol,
                   x_symbol,     blank_symbol, blank_symbol,
                   blank_symbol, blank_symbol, blank_symbol]
    best_move, best_score = computer.minimax(board, x_symbol, o_symbol)
    expect(best_move).to eq(2)
  end

  it 'should win first if possible' do
    board.grid = [ o_symbol, blank_symbol, x_symbol,
                   x_symbol, blank_symbol, blank_symbol,
                   x_symbol, o_symbol,     o_symbol ]
    best_move, best_score = computer.minimax(board, x_symbol, o_symbol)
    expect(best_move).to eq(4)
  end

  it 'should counter opponent first if winning is not possible' do
    board.grid = [ o_symbol, blank_symbol, blank_symbol,
                   x_symbol, blank_symbol, blank_symbol,
                   x_symbol, o_symbol,     o_symbol ]
    best_move, best_score = computer.minimax(board, x_symbol, o_symbol)
    expect(best_move).to eq(4)
  end

	it '' do

	end
end
