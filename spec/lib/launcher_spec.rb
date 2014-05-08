require 'spec_helper'

describe Launcher do
  let(:launcher) { Launcher.new }

  it 'should create player one as human' do
    expect(launcher.player_one.class).to eq(Human)
  end

  it 'should create player two as computer' do
    expect(launcher.player_two.class).to eq(Computer)
  end

  it 'should launch a game' do
    $stdin = StringIO.new('y')
    launcher.expects(:play_game)
    launcher.launch
  end

  it 'should ask for new game' do
    $stdin = StringIO.new('y')
    InputHelper.expects(:ask_for_new_game)
    launcher.launch
  end

end
