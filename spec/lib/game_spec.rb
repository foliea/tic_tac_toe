require 'spec_helper'

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
    expect(game.state).to eq(State::NOT_STARTED)
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
    expect(game.play).to eq(State::NOT_STARTED)
  end

  it "should stop" do
    game.stop
    expect(game.started?).to eq(false)
  end

  it 'should return state winner if there is a winner' do
    game.board.stubs(:win?).returns(x_symbol)
    expect(game.state).to eq(State::X_SYMBOL_WIN)
  end

  it 'should return state draw if draw' do
    game.board.stubs(:draw?).returns(true)
    expect(game.state).to eq(State::DRAW)
  end

  it 'should return state playing if not over' do
    game.stubs(:started?).returns(true)
    expect(game.state).to eq(State::PLAYING)
  end

  it 'should return state forbidden move if move failed' do
    game.stubs(:started?).returns(true)
    game.stubs(:forbidden_move?).returns(true)
    expect(game.state).to eq(State::FORBIDDEN_MOVE)
  end

  it 'should set forbidden move if a player attempt a bad move' do
    $stdin  = StringIO.new('0')
    $stdout = StringIO.new

    game.stubs(:started?).returns(true)
    game.switch_players
    game.play
    expect(game.state).to eq(State::FORBIDDEN_MOVE)
  end

  it 'should stop if winner or draw' do
    game.stubs(:winner).returns(x_symbol)
    game.play
    expect(game.started?).to be_false
  end

  it 'should swap player between each call to play' do
    game.stubs(:started?).returns(true)
    game.play
    expect(game.player_two).to eq(player_one)
    expect(game.player_one).to eq(player_two)
  end

end
