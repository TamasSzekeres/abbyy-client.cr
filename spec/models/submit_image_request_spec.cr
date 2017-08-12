require "../spec_helper"

include Abbyy
include Abbyy::Models

describe SubmitImageRequest do
  request = SubmitImageRequest.new file_path: TEST_VALID_FILE_PATH

  it "raises ArgumentError because of invalid filepath" do
    expect_raises(ArgumentError) do
      SubmitImageRequest.new file_path: TEST_INVALID_FILE_PATH
    end
    request.file_path.should_not eq(TEST_INVALID_FILE_PATH)

    expect_raises(ArgumentError) do
      request.file_path = TEST_INVALID_FILE_PATH
    end
    request.file_path.should_not eq(TEST_INVALID_FILE_PATH)
  end

  it "raises ArgumentError when set invalid task_id" do
    expect_raises(ArgumentError) do
      SubmitImageRequest.new file_path: TEST_INVALID_FILE_PATH, task_id: TEST_VALID_TASK_ID
    end
    request.task_id.should_not eq(TEST_INVALID_TASK_ID)

    expect_raises(ArgumentError) do
      request.task_id = TEST_INVALID_TASK_ID
    end
    request.task_id.should_not eq(TEST_INVALID_TASK_ID)
  end
end
