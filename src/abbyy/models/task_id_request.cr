require "./base_request"

module Abbyy::Models
  # Request object for holding only `taskId` parameter.
  class TaskIdRequest < BaseRequest
    # Specifies the identifier of the task.
    getter task_id : String? = nil

    def initialize(@task_id : String? = nil)
      if task_id.is_a? String
        raise ArgumentError.new "Invalid taskId: #{task_id}" unless task_id.as(String).is_task_id?
      end
      @task_id = task_id
    end

    def task_id=(task_id : String?)
      if task_id.is_a? String
        raise ArgumentError.new "Invalid taskId: #{task_id}" unless task_id.as(String).is_task_id?
      end
      @task_id = task_id
    end

    def params : Hash(String, String)
      hash = {} of String => String
      hash["taskId"] = @task if @task
      hash
    end
  end
end
