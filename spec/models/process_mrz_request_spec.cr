require "../spec_helper"

include Abbyy
include Abbyy::Models

describe ProcessMRZRequest do
  request = ProcessMRZRequest.new file_path: TEST_VALID_FILE_PATH

  it "raises ArgumentError because of invalid filepath" do
    expect_raises(ArgumentError) do
      ProcessMRZRequest.new file_path: TEST_INVALID_FILE_PATH
    end
    request.file_path.should_not eq(TEST_INVALID_FILE_PATH)

    expect_raises(ArgumentError) do
      request.file_path = TEST_INVALID_FILE_PATH
    end
    request.file_path.should_not eq(TEST_INVALID_FILE_PATH)
  end
end
