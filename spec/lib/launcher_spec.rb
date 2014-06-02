require 'spec_helper'
require 'stringio'
require 'launcher'

describe Launcher do
  let(:launcher) { Launcher.new }

  it 'should create player one as human' do
    expect(launcher.player_one.class).to eq(Human)
  end

  it 'should create player two as computer' do
    expect(launcher.player_two.class).to eq(Computer)
  end

  it 'should ask for new game' do
    InputHelper.expects(:ask_for_new_game)
    launcher.ask_for_new_game
  end

  it 'should be able to start a game' do
    launcher.game.expects(:start)
    launcher.start
  end

  it 'should play if a game is started' do
    launcher.start
    expect(launcher.play?).to be_true
  end

  it 'should run a game until the end' do
    game = Game.new(Board.new(3),
                    Computer.new(Params::X_SYMBOL),
                    Computer.new(Params::O_SYMBOL))
    launcher.set(game)
    launcher.stubs(:display)
    launcher.start
    launcher.run
    expect(launcher.play?).to be_false
  end

  context 'when displaying' do

    it 'should print board' do
      OutputHelper.stubs(:print_board)
      OutputHelper.expects(:print_board).with(launcher.game.board)
      launcher.display
    end

    it 'should print state' do
      OutputHelper.stubs(:print_board)
      OutputHelper.stubs(:print_state)
      OutputHelper.expects(:print_state).with(launcher.game.state)
      launcher.display
    end
  end

end
