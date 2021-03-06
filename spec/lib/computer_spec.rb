require 'spec_helper'
require 'computer'
require 'board'

describe Computer do
  let(:board)        { Board.new(3) }
  let(:computer)     { Computer.new(Params::X_SYMBOL) }

  it 'must have symbol' do
    expect(computer.symbol).to_not be_nil
  end

  it 'finds opponent symbol' do
    expect(computer.opponent_symbol).to eq(Params::O_SYMBOL)
  end

  it 'wins' do
    board.set('XX.
               O..
               O..')
    best_move = computer.find_best_move(board)
    expect(best_move).to eq(2)
  end

  it 'counters opponent' do
    board.set('OO.
               X..
               ...')
    best_move = computer.find_best_move(board)
    expect(best_move).to eq(2)
  end

  it 'draws if winning is not possible' do
    board.set('XXO
               OOX
               XO.')
    best_move = computer.find_best_move(board)
    expect(best_move).to eq(8)
  end

  context 'when opponent can win' do

    it 'wins first if winning is possible' do
      board.set('.O.
                 XO.
                 X..')
      best_move = computer.find_best_move(board)
      expect(best_move).to eq(0)
    end

    it 'counters opponent first if winning is not possible' do
      board.set('O..
                 X..
                 XOO')
      best_move = computer.find_best_move(board)
      expect(best_move).to eq(4)
    end

  end

end
