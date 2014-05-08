require 'spec_helper'
require 'computer'
require 'board'

describe Computer do
  let(:x_symbol)     { Params::X_SYMBOL }
  let(:o_symbol)     { Params::O_SYMBOL }
  let(:blank_symbol) { Params::BLANK_SYMBOL }
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
    best_move = computer.find_best_move(board)
    expect(best_move).to eq(2)
  end

  it 'should counter opponent' do
    board.grid = [ o_symbol,     o_symbol,     blank_symbol,
                   x_symbol,     blank_symbol, blank_symbol,
                   blank_symbol, blank_symbol, blank_symbol]
    best_move = computer.find_best_move(board)
    expect(best_move).to eq(2)
  end

  it 'should draw if winning is not possible' do
    board.grid = [ x_symbol, x_symbol, o_symbol,
                   o_symbol, o_symbol, x_symbol,
                   x_symbol, o_symbol, blank_symbol ]
    best_move = computer.find_best_move(board)
    expect(best_move).to eq(8)
  end

  context 'when opponent can win' do

    it 'should win first if winning is possible' do
      board.grid = [ blank_symbol, o_symbol,     blank_symbol,
                     x_symbol,     o_symbol,     blank_symbol,
                     x_symbol,     blank_symbol, blank_symbol ]
      best_move = computer.find_best_move(board)
      expect(best_move).to eq(0)
    end

    it 'should counter opponent first if winning is not possible' do
      board.grid = [ o_symbol, blank_symbol, blank_symbol,
                     x_symbol, blank_symbol, blank_symbol,
                     x_symbol, o_symbol,     o_symbol ]
      best_move = computer.find_best_move(board)
      expect(best_move).to eq(4)
    end

  end

end
