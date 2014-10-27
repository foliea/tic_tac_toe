require 'spec_helper'
require 'game'
require 'board'
require 'human'
require 'computer'
require 'input_helper'

describe Game do
  let(:x_symbol)   { Params::X_SYMBOL }
  let(:o_symbol)   { Params::O_SYMBOL }
  let(:player_one) { Computer.new(x_symbol) }
  let(:player_two) { Human.new(o_symbol, InputHelper) }
  let(:board)      { Board.new(3) }
  let(:game)       { Game.new(board, player_one, player_two) }

  it 'must have player one' do
    expect(game.player_one).to_not be_nil
  end

  it 'must have player two' do
    expect(game.player_two).to_not be_nil
  end

  it 'sets current_player to player_two' do
    expect(game.current_player).to eq(player_one)
  end

  it 'creates a board' do
    expect(game.board).to_not be_nil
  end

  it 'detects if its started' do
    expect(game).not_to be_started
    expect(game.state).to eq(Game::NOT_STARTED)
  end

  it 'starts' do
    game.start
    expect(game.started?).to eq(true)
  end

  it 'resets board on start' do
    game.board.expects(:reset)
    game.start
  end

  it 'must be started to play' do
    expect(game.play).to eq(Game::NOT_STARTED)
  end

  it 'stops' do
    game.stop
    expect(game).not_to be_started
  end

  context 'when game is over' do

    it 'should stop' do
      game.stubs(:winner).returns(x_symbol)
      game.play
      expect(game).not_to be_started
    end
  end

  context 'when there is a winner' do

    it 'returns state winner' do
      game.board.stubs(:win?).returns(x_symbol)
      expect(game.state).to eq(Game::X_SYMBOL_WIN)
    end
  end

  context 'when draw' do

    it 'returns state draw' do
      game.board.stubs(:draw?).returns(true)
      expect(game.state).to eq(Game::DRAW)
    end
  end

  context 'when playing' do

    it 'returns state playing' do
      game.stubs(:started?).returns(true)
      expect(game.state).to eq(Game::PLAYING)
    end
  end

  context 'when a player attempt to do a forbidden move' do

    it 'sets forbidden move' do
      $stdin  = StringIO.new('0')
      $stdout = StringIO.new

      game.stubs(:started?).returns(true)
      game.switch_current_player
      game.play
      expect(game.state).to eq(Game::FORBIDDEN_MOVE)
    end

    it 'returns state forbidden move' do
      game.stubs(:started?).returns(true)
      game.stubs(:forbidden_move?).returns(true)
      expect(game.state).to eq(Game::FORBIDDEN_MOVE)
    end
  end

  context 'between each call to play' do

    it 'swaps player' do
      game.stubs(:started?).returns(true)
      game.play
      expect(game.current_player).to eq(player_two)
    end
  end
end
