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
    $stdin = StringIO.new('y')
    InputHelper.expects(:ask_for_new_game)
    launcher.launch
  end

  it 'should start a game' do
    launcher.start
    expect(launcher.game.started?).to be_true
  end

  it 'should play if game is started' do
    launcher.start
    expect(launcher.play?).to be_true
  end
 
  it 'should run a game until this end' do
    game = Game.new(Board.new(3), Computer.new(Params::X_SYMBOL), Computer.new(Params::O_SYMBOL))
	
    launcher.set(game)
    launcher.start
    launcher.run
    expect(launcher.play?).to be_false
  end

  context 'when game is running' do

    it 'should display' do
      launcher.stubs(:play)
      launcher.stubs(:display)
      launcher.stubs(:play?).returns(true, false)
      launcher.expects(:display)
      launcher.run
    end
  end

  context 'when displaying' do
    module OutputHelper
      def self.print_board(*args) ; end
      def self.print_state(*args) ; end
    end

    it 'should print board' do
      OutputHelper.expects(:print_board).with(launcher.game.board)
      launcher.display
    end
    
    it 'should print state' do
      OutputHelper.expects(:print_state).with(launcher.game.state)
      launcher.display
    end
  end
  
end
