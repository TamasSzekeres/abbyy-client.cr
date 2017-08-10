require "./base_request"

module Abbyy::Models
  # Request object for holding only `taskId` parameter.
  class TaskIdRequest < BaseRequest
    # Specifies the identifier of the task.
    property task_id : String

    def initialize(@task_id : String)
    end

    def params : Hash(String, String)
      {"taskId" => @taskId}
    end
  end
end
