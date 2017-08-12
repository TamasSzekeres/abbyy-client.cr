require "../spec_helper"

include Abbyy
include Abbyy::Models

describe Region do
  describe "#initialize" do
    it "should initialize without params" do
      region = Region.new
      region.left.should eq(-1)
      region.top.should eq(-1)
      region.right.should eq(-1)
      region.bottom.should eq(-1)
    end

    it "should initialize with params" do
      region = Region.new(2, 63, 51, 15)
      region.left.should eq(2)
      region.top.should eq(63)
      region.right.should eq(51)
      region.bottom.should eq(15)
    end

    it "should initialize from 4 length array" do
      region = Region.new([21, 35, 61, 65])
      region.left.should eq(21)
      region.top.should eq(35)
      region.right.should eq(61)
      region.bottom.should eq(65)
    end

    it "should not initialize from not 4 length array" do
      expect_raises do
        Region.new([11, 82, 71])
      end

      expect_raises do
        Region.new([11, 82, 71, 72, 51])
      end
    end
  end

  describe "#to_a" do
    it "returns a 4 length array" do
      Region.new.to_a.should eq([-1, -1, -1, -1])
      Region.new(1, 2, 3, 4).to_a.should eq([1, 2, 3, 4])
    end
  end

  describe "#to_s" do
    it "returns coordinates separated with comma" do
      Region.new.to_s.should eq("-1,-1,-1,-1")
      Region.new(46, 63, 99, 14).to_s.should eq("46,63,99,14")
    end
  end
end
