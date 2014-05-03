require 'spec_helper'

describe Launcher do
  let(:launcher) { Launcher.new }

  it 'should create player one as human' do
    expect(launcher.player_one.class).to eq(Human)
  end

  it 'should create player two as computer' do
    expect(launcher.player_two.class).to eq(Computer)
  end

  it 'should create a board' do
    expect(launcher.board).to_not be_nil
  end

  it 'should create a game' do
    expect(launcher.game).to_not be_nil
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

  it 'should start a game' do
  #  launcher.game.expects(:start)
  #  launcher.play_game
  end

end
