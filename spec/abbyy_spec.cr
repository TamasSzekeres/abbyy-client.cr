require "./spec_helper"

include Abbyy

describe Abbyy do
  describe Client do
    it "works" do
      true.should eq(true)
    end
  end

  describe String do
    it "should recognize valid taskId's" do
      "".is_task_id?.should be_false
      "22345200-abe8-4f60-0d43c5f6c0f6".is_task_id?.should be_false
      "22345200-abe8-4f60-90c8-gd43c5f6c0f6".is_task_id?.should be_false
      "f23a5200-0b58-2f60-90c8-0d43c5f6c0f6".is_task_id?.should be_true
    end
  end
end
