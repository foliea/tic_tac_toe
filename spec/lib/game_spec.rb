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

  it 'should have player one' do
    expect(game.player_one).to_not be_nil
  end

  it 'should have player two' do
    expect(game.player_two).to_not be_nil
  end

  it 'should create a board' do
    expect(game.board).to_not be_nil
  end

  it 'should detect if its started' do
    expect(game.started?).to eq(false)
    expect(game.state).to eq(Game::NOT_STARTED)
  end

  it 'should start' do
    game.start
    expect(game.started?).to eq(true)
  end

  it 'should reset board on start' do
    game.board.expects(:reset)
    game.start
  end

  it 'should be started to play' do
    expect(game.play).to eq(Game::NOT_STARTED)
  end

  it "should stop" do
    game.stop
    expect(game.started?).to eq(false)
  end

  context 'when game is over' do

    it 'should stop' do
      game.stubs(:winner).returns(x_symbol)
      game.play
      expect(game.started?).to be_false
    end
  end

  context 'when there is a winner' do

    it 'should return state winner' do
      game.board.stubs(:win?).returns(x_symbol)
      expect(game.state).to eq(Game::X_SYMBOL_WIN)
    end
  end

  context 'when draw' do

    it 'should return state draw' do
      game.board.stubs(:draw?).returns(true)
      expect(game.state).to eq(Game::DRAW)
    end
  end

  context 'when playing' do

    it 'should return state playing' do
      game.stubs(:started?).returns(true)
      expect(game.state).to eq(Game::PLAYING)
    end
  end

  context 'when a player attempt to do a forbidden move' do

    it 'should set forbidden move' do
      $stdin  = StringIO.new('0')
      $stdout = StringIO.new

      game.stubs(:started?).returns(true)
      game.switch_players
      game.play
      expect(game.state).to eq(Game::FORBIDDEN_MOVE)
    end

    it 'should return state forbidden move' do
      game.stubs(:started?).returns(true)
      game.stubs(:forbidden_move?).returns(true)
      expect(game.state).to eq(Game::FORBIDDEN_MOVE)
    end
  end

  context 'between each call to play' do

    it 'should swap player' do
      game.stubs(:started?).returns(true)
      game.play
      expect(game.current_player).to eq(player_two)
    end
  end
end
