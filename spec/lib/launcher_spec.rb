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

  it 'should play if game is started' do
    launcher.game.start
    expect(launcher.play?).to be_true
  end
 
 	# Is this test really necessary ?	
	it 'should play while it can play' do
  	launcher.stubs(:play)
    launcher.stubs(:display)

		launcher.stubs(:play?).returns(true, false)
    launcher.expects(:play)
    launcher.run
  end

end
