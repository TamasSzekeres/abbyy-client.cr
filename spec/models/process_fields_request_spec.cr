require "../spec_helper"

include Abbyy
include Abbyy::Models

describe ProcessFieldsRequest do
  request = ProcessFieldsRequest.new task_id: TEST_VALID_TASK_ID, file_path: TEST_VALID_FILE_PATH

  it "raises ArgumentError because of invalid filepath" do
    expect_raises(ArgumentError) do
      ProcessFieldsRequest.new task_id: TEST_VALID_TASK_ID, file_path: TEST_INVALID_FILE_PATH
    end
    request.file_path.should_not eq(TEST_INVALID_FILE_PATH)

    expect_raises(ArgumentError) do
      request.file_path = TEST_INVALID_FILE_PATH
    end
    request.file_path.should_not eq(TEST_INVALID_FILE_PATH)
  end

  it "raises ArgumentError because of invalid task_id" do
    expect_raises(ArgumentError) do
      ProcessFieldsRequest.new task_id: TEST_INVALID_TASK_ID, file_path: TEST_VALID_FILE_PATH
    end
    request.task_id.should_not eq(TEST_INVALID_TASK_ID)

    expect_raises(ArgumentError) do
      request.task_id = TEST_INVALID_TASK_ID
    end
    request.task_id.should_not eq(TEST_INVALID_TASK_ID)

    expect_raises(ArgumentError, "task_id must be string") do
      request.task_id = nil
    end
    request.task_id.should_not eq(nil)
  end

  describe "description" do
    it "can contain up to 255 characters" do
      request.description = "a" * 255
      request.description.should eq("a" * 255)
    end

    it "cannot contain more than 255 characters" do
      expect_raises(ArgumentError, "'description' parameter cannot contain more than 255 characters") do
        request.description = "a" * 256
      end
      request.description.should_not eq("a" * 256)
    end
  end
end
