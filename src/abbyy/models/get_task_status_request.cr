require "./task_id_request"

module Abbyy::Models
  # Request object for `/getTaskStatus` API-method.
  #
  # **See** [http://ocrsdk.com/documentation/apireference/getTaskStatus/](http://ocrsdk.com/documentation/apireference/getTaskStatus/)
  class GetTaskStatusRequest < TaskIdRequest
  end
end
