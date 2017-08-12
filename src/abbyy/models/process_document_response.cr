require "./task_response"

module Abbyy::Models
  # Response object for [/processDocument](http://ocrsdk.com/documentation/apireference/processDocument/) API-method.
  #
  # ###Status codes
  #
  # The following status codes can be returned when this method is called:
  # - **200** Successful method call.
  # - **450** Incorrect parameters have been passed. One of the following errors occurred:
  #   - The identifier of the task has not been specified.
  #   - Incorrect recognition language has been specified.
  #   - Incorrect processing profile has been specified.
  #   - Incorrect export format has been specified.
  #   - The task with the specified identifier has been deleted.
  #   - There is no task with the specified identifier.
  #   - The task with the specified identifier cannot be started
  # (e.g. because it is already being processed).
  #   - Task description length exceeds 255 characters.
  # - **550** An internal program error occurred while processing the image.
  # - **551** The number of uploaded images exceeds the allowed limit.
  class ProcessDocumentResponse < TaskResponse
  end
end
