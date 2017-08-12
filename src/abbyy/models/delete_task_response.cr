require "./task_response"

module Abbyy::Models
  # Response object for [/deleteTask](http://ocrsdk.com/documentation/apireference/deleteTask/) API-method.
  #
  # ###Status codes
  #
  # The following status codes can be returned when this method is called:
  # - **200** Successful method call.
  # - **450** Incorrect parameters have been passed. One of the following errors occurred:
  #   - The identifier of the task has not been specified.
  #   - There is no task with the specified identifier.
  #   - The task is in progress.
  class DeleteTaskResponse < TaskResponse
  end
end
