require 'spec_helper'

describe Game do
  let(:player_one) { Computer.new(Board::X_SYMBOL) }
  let(:player_two) { Computer.new(Board::O_SYMBOL) }
  let(:x_symbol)   { Board::X_SYMBOL }
  let(:game)       { Game.new(player_one, player_two) }

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
    expect(game.started?).to eq(nil)
  end

  it 'should start' do
    game.start
    expect(game.started?).to eq(true)
  end

  it 'should be started to play' do
    expect(game.play).to be_nil
  end

  it "should stop" do
    game.stop
    expect(game.started?).to eq(false)
  end

  it 'should return winner' do
    game.board.stubs(:win?).returns(x_symbol)
    expect(game.winner).to eq(x_symbol)
  end

  it 'should return -1 if draw' do
    game.board.stubs(:draw?).returns(true)
    expect(game.winner).to eq(-1)
  end

  it 'should return 0 if not over' do
    expect(game.winner).to eq(0)
  end

  it 'should stop if winner or draw' do
    game.stubs(:winner).returns(x_symbol)
    game.start
    game.play
    expect(game.started?).to be_false
  end

  it 'should swap player between each call to play' do
    p_1 = game.player_one
    game.start
    game.play
    expect(game.player_two).to eq(p_1)
  end
end
