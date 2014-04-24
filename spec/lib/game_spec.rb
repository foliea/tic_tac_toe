require 'spec_helper'

describe Game do
  before { subject = Game.new }
  #it "should detect draw" do
  #  subject.stubs(:empty_squares).returns(Array.new)
  #  subject.should be_draw
  #end
  
  it "should detect win" do
    mark = 'X'
    possible_wins = [
      [mark, mark, mark, nil, nil, nil, nil, nil, nil],    
      [nil, nil, nil, mark, mark, mark, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, mark, mark, mark],
      [mark, nil, nil, mark, nil, nil, mark, nil, nil],
      [nil, mark, nil, nil, mark, nil, nil, mark, nil],
      [nil, nil, mark, nil, nil, mark, nil, nil, mark],
      [mark, nil, nil, nil, mark, nil, nil, nil, mark],
      [nil, nil, mark, nil, mark, nil, mark, nil, nil],
    ]
    possible_wins.each do |grid|
      subject.stubs(:grid).returns(grid)
      subject.should be_win(mark)
    end
  end
end