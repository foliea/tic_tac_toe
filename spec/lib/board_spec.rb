require 'spec_helper'

describe Board do
  before { subject = Board.new }
  
  it "shouldn't tick with outside move" do
    subject.stubs(:square).returns(nil)
    subject.tick(-1, 'X').should be nil
  end
  
  it "shouldn't tick on an already ticked square" do
    subject.stubs(:outside_grid).returns(nil)
    subject.tick(0, 'X')
    subject.tick(0, 'X').should be nil
  end
  
  it "should decrease empty_squares" do
    count = subject.empty_squares.size
    subject.tick(0, 'X')
    subject.empty_squares.size.should be < count
  end
  
  it "should detect outside moves" do
    subject.send(:outside_grid?, -1).should be_true
    subject.send(:outside_grid?, 9).should be_true
  end
end