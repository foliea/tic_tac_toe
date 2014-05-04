require 'spec_helper'

describe InputHelper do
  let(:output) { StringIO.new }

  it 'should ask for next location from stdin' do
    input = StringIO.new('1')
    expect(InputHelper.ask_for_next_location(input, output)).to eq(0)
  end

  it 'should ask for new game' do
    input = StringIO.new('y')
    expect(InputHelper.ask_for_new_game(input, output)).to eq('y')
  end
end
