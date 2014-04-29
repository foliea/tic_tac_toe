require 'spec_helper'

describe InputHelper do
  
  it 'should ask for next location from stdin' do
    stream = StringIO.new('1')
    expect(InputHelper.ask_for_next_location(stream)).to eq(0)
  end
  
  it 'should ask for new game question' do
    stream = StringIO.new('y') 
    expect(InputHelper.ask_for_new_game(stream)).to eq('y')
  end
end
