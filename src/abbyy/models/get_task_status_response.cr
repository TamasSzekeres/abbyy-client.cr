require "./task_response"

module Abbyy::Models
  # Response object for [/getTaskStatus](http://ocrsdk.com/documentation/apireference/getTaskStatus/) API-method.
  #
  # ###Status codes
  #
  # The following status codes can be returned when this method is called:
  # - **200** Successful method call.
  # - **450** Incorrect parameters have been passed. One of the following errors occurred:
  #   - The identifier of the task has not been specified.
  #   - There is no task with the specified identifier.
  class GetTaskStatusResponse < TaskResponse
  end
end
