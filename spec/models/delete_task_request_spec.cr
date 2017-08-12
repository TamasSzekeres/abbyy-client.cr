require "../spec_helper"

include Abbyy
include Abbyy::Models

describe DeleteTaskRequest do
  request = DeleteTaskRequest.new task_id: TEST_VALID_TASK_ID

  it "raises ArgumentError when set invalid task_id" do
    expect_raises(ArgumentError) do
      DeleteTaskRequest.new task_id: TEST_INVALID_TASK_ID
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
end
