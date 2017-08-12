require "./task_id_request"

module Abbyy::Models
  # Request object for [/getTaskStatus](http://ocrsdk.com/documentation/apireference/getTaskStatus/) API-method.
  class GetTaskStatusRequest < TaskIdRequest
    def initialize(task_id : String)
      raise ArgumentError.new "Invalid taskId: #{task_id}" unless task_id.is_task_id?
      @task_id = task_id
    end

    def task_id=(task_id : String)
      raise ArgumentError.new "Invalid taskId: #{task_id}" unless task_id.is_task_id?
      @task_id = task_id
    end

    def task_id=(task_id : String?)
      if task_id
        raise ArgumentError.new "Invalid taskId: #{task_id}" unless task_id.as(String).is_task_id?
      else
        raise ArgumentError.new "task_id cannot be nil"
      end
      @task_id = task_id
    end
  end
end
