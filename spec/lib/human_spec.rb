require 'spec_helper'

describe Human do
  let(:board) { Board.new }
  let(:human) { Human.new(Board::X_SYMBOL, InputHelper) }

  it 'should have symbol' do
    expect(human.symbol).to_not be_nil
  end

  it 'should get next location from command line' do
    $stdin = StringIO.new('1')
    expect(human.find_next_location).to eq(0)
  end

end