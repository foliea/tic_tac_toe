require 'spec_helper'
require 'input_helper'
require 'board'
require 'human'

describe Human do
  let(:board) { Board.new(3) }
  let(:human) { Human.new(Params::X_SYMBOL, InputHelper) }

  it 'must have symbol' do
    expect(human.symbol).to_not be_nil
  end

  it 'gets next location from command line' do
    $stdin  = StringIO.new('1')
    $stdout = StringIO.new
    expect(human.find_next_location).to eq(0)
  end

  it 'moves after finding next location' do
    human.stubs(:find_next_location).returns(1)
    expect(human.move(board)).to_not be_nil
  end
end
