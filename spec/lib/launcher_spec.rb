require 'spec_helper'
require 'stringio'
require 'launcher'

describe Launcher do
  let(:launcher) { Launcher.new }

  it 'creates player one as human' do
    expect(launcher.player_one.class).to eq(Human)
  end

  it 'creates player two as computer' do
    expect(launcher.player_two.class).to eq(Computer)
  end

  it 'asks for new game' do
    InputHelper.expects(:ask_for_new_game)
    launcher.ask_for_new_game
  end

  it 'must be able to start a game' do
    launcher.game.expects(:start)
    launcher.start
  end

  it 'plays if a game is started' do
    launcher.start
    expect(launcher).to be_playing
  end

  it 'should be able to play multiple games in a row' do
    launcher.stubs(:display)
    launcher.stubs(:ask_for_new_game).returns('y', 'y', 'n')
    launcher.expects(:run).at_least(2)
    launcher.launch
  end

  it 'runs a game until the end' do
    game = Game.new(Board.new(3),
                    Computer.new(Params::X_SYMBOL),
                    Computer.new(Params::O_SYMBOL))
    launcher.set(game)
    launcher.stubs(:display)
    launcher.start
    launcher.run
    expect(launcher).not_to be_playing
  end

  context 'when displaying' do

    it 'prints board' do
      OutputHelper.stubs(:print_board)
      OutputHelper.expects(:print_board).with(launcher.game.board)
      launcher.display
    end

    it 'prints state' do
      OutputHelper.stubs(:print_board)
      OutputHelper.stubs(:print_state)
      OutputHelper.expects(:print_state).with(launcher.game.state)
      launcher.display
    end
  end

end
