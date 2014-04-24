require 'spec_helper'

describe Board do
  before { subject = Board.new }

  it "should assign 9 squares" do
    subject.to_a.size.should be 9
  end
  
  it "shouldn't move outside" do
    subject.move_available?(-1).should be_false
  end

  it "shouldn't move on non empty square" do
    subject.move(0, 'X')
    subject.move_available?(0).should be_false
  end

  it "should move on empty square" do
    subject.move(0, 'X').should_not be_nil
  end

  it "should decrease empty squares" do
    count = subject.empty_squares.size
    subject.move(0, 'X')
    subject.empty_squares.size.should be < count
  end

  it 'should detect if board is full with no winner' do
    (0..8).each { |i| subject.move(i, 'X') }
    subject.should be_draw
  end

  it "should detect winning in first colum" do
    subject.move(0, 'X')
    subject.move(3, 'X')
    subject.move(6, 'X')
    subject.win?('X').should be_true
  end
end
