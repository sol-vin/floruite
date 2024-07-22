require "./spec_helper"

describe Flourite::Chunk do
  it "should make a new chunk" do
    c = Flourite::Chunk.new(0, 0, 0)
    c.should_not eq nil
  end

  it "should report index_to_position and position_to_index properly" do
    x, y, z = 5, 0, 0
    Flourite::Chunk.index_to_position(5).should eq IVector3.new(x, y, z)

    x, y, z = 0, 1, 0
    Flourite::Chunk.index_to_position(Flourite::Chunk::MAX_X).should eq IVector3.new(x, y, z)

    x, y, z = 0, 0, 1
    Flourite::Chunk.index_to_position(Flourite::Chunk::PAGE).should eq IVector3.new(x, y, z)

    x, y, z = 11, 20, 1
    Flourite::Chunk.index_to_position(Flourite::Chunk.position_to_index(x, y, z)).should eq IVector3.new(x, y, z)

    x, y, z = 22, 1, 10
    Flourite::Chunk.index_to_position(Flourite::Chunk.position_to_index(x, y, z)).should eq IVector3.new(x, y, z)

    x, y, z = 27, 5, 6
    Flourite::Chunk.index_to_position(Flourite::Chunk.position_to_index(x, y, z)).should eq IVector3.new(x, y, z)

    x, y, z = 28, 6, 8
    Flourite::Chunk.index_to_position(Flourite::Chunk.position_to_index(x, y, z)).should eq IVector3.new(x, y, z)
  end

  it "should be able to use contains?" do
    c = Flourite::Chunk.new(0, 0, 0)
    c.contains?(0, 0, 0).should be_true
    c.contains?(Flourite::Chunk::MAX_X-1, Flourite::Chunk::MAX_Y-1, Flourite::Chunk::MAX_Z-1).should be_true
    c.contains?(Flourite::Chunk::MAX_X, 0, 0).should be_false
    c.contains?(0, Flourite::Chunk::MAX_Y, 0).should be_false
    c.contains?(0, 0, Flourite::Chunk::MAX_Z).should be_false

    c = Flourite::Chunk.new(1, 0, 0)
    c.contains?(0, 0, 0).should be_false
    c.contains?(Flourite::Chunk::MAX_X-1, Flourite::Chunk::MAX_Y-1, Flourite::Chunk::MAX_Z-1).should be_false
    c.contains?(Flourite::Chunk::MAX_X, 0, 0).should be_true
    c.contains?(0, Flourite::Chunk::MAX_Y, 0).should be_false
    c.contains?(0, 0, Flourite::Chunk::MAX_Z).should be_false

    
    c = Flourite::Chunk.new(0, 1, 0)
    c.contains?(0, 0, 0).should be_false
    c.contains?(Flourite::Chunk::MAX_X-1, Flourite::Chunk::MAX_Y-1, Flourite::Chunk::MAX_Z-1).should be_false
    c.contains?(Flourite::Chunk::MAX_X, 0, 0).should be_false
    c.contains?(0, Flourite::Chunk::MAX_Y, 0).should be_true
    c.contains?(0, 0, Flourite::Chunk::MAX_Z).should be_false

    c = Flourite::Chunk.new(0, 0, 1)
    c.contains?(0, 0, 0).should be_false
    c.contains?(Flourite::Chunk::MAX_X-1, Flourite::Chunk::MAX_Y-1, Flourite::Chunk::MAX_Z-1).should be_false
    c.contains?(Flourite::Chunk::MAX_X, 0, 0).should be_false
    c.contains?(0, Flourite::Chunk::MAX_Y, 0).should be_false
    c.contains?(0, 0, Flourite::Chunk::MAX_Z).should be_true

    c = Flourite::Chunk.new(-1, 0, 0)
    c.contains?(0, 0, 0).should be_false
    c.contains?(-Flourite::Chunk::MAX_X+1, -Flourite::Chunk::MAX_Y+1, -Flourite::Chunk::MAX_Z+1).should be_false
    c.contains?(-Flourite::Chunk::MAX_X, 0, 0).should be_true
    c.contains?(0, -Flourite::Chunk::MAX_Y, 0).should be_false
    c.contains?(0, 0, -Flourite::Chunk::MAX_Z).should be_false

    
    c = Flourite::Chunk.new(0, -1, 0)
    c.contains?(0, 0, 0).should be_false
    c.contains?(-Flourite::Chunk::MAX_X+1, -Flourite::Chunk::MAX_Y+1, -Flourite::Chunk::MAX_Z+1).should be_false
    c.contains?(-Flourite::Chunk::MAX_X, 0, 0).should be_false
    c.contains?(0, -Flourite::Chunk::MAX_Y, 0).should be_true
    c.contains?(0, 0, -Flourite::Chunk::MAX_Z).should be_false

    c = Flourite::Chunk.new(0, 0, -1)
    c.contains?(0, 0, 0).should be_false
    c.contains?(-Flourite::Chunk::MAX_X+1, -Flourite::Chunk::MAX_Y+1, -Flourite::Chunk::MAX_Z+1).should be_false
    c.contains?(-Flourite::Chunk::MAX_X, 0, 0).should be_false
    c.contains?(0, -Flourite::Chunk::MAX_Y, 0).should be_false  
    c.contains?(0, 0, -Flourite::Chunk::MAX_Z).should be_true
  end

  it "should be able to use contains_index?" do
    c = Flourite::Chunk.new(0, 0, 0)
    c.contains_index?(0, 0, 0).should be_true
    c.contains_index?(Flourite::Chunk::MAX_X-1, Flourite::Chunk::MAX_Y-1, Flourite::Chunk::MAX_Z-1).should be_true
    c.contains_index?(Flourite::Chunk::MAX_X, 0, 0).should be_false
    c.contains_index?(0, Flourite::Chunk::MAX_Y, 0).should be_false
    c.contains_index?(0, 0, Flourite::Chunk::MAX_Z).should be_false
  end
end