require "./task_id_request"

module Abbyy::Models
  # Request object for [/deleteTask](http://ocrsdk.com/documentation/apireference/deleteTask/) API-method.
  class DeleteTaskRequest < TaskIdRequest
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
        raise ArgumentError.new "task_id must be string"
      end
      @task_id = task_id
    end
  end
end
