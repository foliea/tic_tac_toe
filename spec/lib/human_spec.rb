require 'spec_helper'

describe Human do
  let(:board) { Board.new }
  let(:human) { Human.new(Board::X_SYMBOL, InputHelper) }

  it 'should have symbol' do
    expect(human.symbol).to_not be_nil
  end

  it 'should get next location from user' do
    $stdin = StringIO.new('0')
    expect(human.find_next_location).to be 0
  end

end
