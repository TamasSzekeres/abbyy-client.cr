require "./base_request"
require "./file_body"

module Abbyy::Models
  # Request object for `/processMRZ` API-method.
  #
  # **See** [http://ocrsdk.com/documentation/apireference/processMRZ/](http://ocrsdk.com/documentation/apireference/processMRZ/).
  class ProcessMRZRequest < BaseRequest
    include FileBody
  end
end
