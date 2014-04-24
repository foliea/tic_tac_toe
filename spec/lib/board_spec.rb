require 'spec_helper'

describe Board do
  before { subject = Board.new }
  
  it "should assign 9 squares" do
    subject.grid.size.should be 9
  end
  it "shouldn't tick outside" do
    subject.stubs(:square).returns(nil)
    subject.tick(-1, 'X').should be_nil
  end
  
  it "shouldn't tick on non empty square" do
    subject.stubs(:outside_grid).returns(nil)
    subject.tick(0, 'X')
    subject.tick(0, 'X').should be_nil
  end
  
  it "should tick on empty square" do
    subject.stubs(:outside_grid).returns(nil)
    subject.tick(0, 'X').should_not be_nil
  end
  
  it "should decrease empty squares" do
    count = subject.empty_squares.size
    subject.tick(0, 'X')
    subject.empty_squares.size.should be < count
  end
  
  it 'should detect if board is full with no winner' do
    (0..8).each { |i| subject.tick(i, 'X') }
    subject.should be_draw
  end
  
  #
  
  it "should detect winning in first row" do
    (0..2).each { |i| subject.tick(i, 'X') }
    subject.win?('X').should be_true
  end
  
  it "should detect winning in second row" do
    (3..5).each { |i| subject.tick(i, 'X') }
    subject.win?('X').should be_true
  end

  it "should detect winning in third row" do
    (6..8).each { |i| subject.tick(i, 'X') }
    subject.win?('X').should be_true
  end
  
  it "should detect winning in first colum" do
    subject.tick(0, 'X')
    subject.tick(3, 'X')
    subject.tick(6, 'X')
    subject.win?('X').should be_true
  end
  
  it "should detect winning in second colum" do
    subject.tick(1, 'X')
    subject.tick(4, 'X')
    subject.tick(7, 'X')
    subject.win?('X').should be_true
  end
  
  it "should detect winning in third colum" do
    subject.tick(2, 'X')
    subject.tick(5, 'X')
    subject.tick(8, 'X')
    subject.win?('X').should be_true
  end
  
  it "should detect winning in first diagonale" do
    subject.tick(0, 'X')
    subject.tick(4, 'X')
    subject.tick(8, 'X')
    subject.win?('X').should be_true
  end
  
  it "should detect winning in second diagonale" do
    subject.tick(6, 'X')
    subject.tick(4, 'X')
    subject.tick(2, 'X')
    subject.win?('X').should be_true
  end
end