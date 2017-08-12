require "./base_request"
require "./file_body"

module Abbyy::Models
  # Request object for [/processMRZ](http://ocrsdk.com/documentation/apireference/processMRZ/) API-method.
  class ProcessMRZRequest < BaseRequest
    include FileBody

    def initialize(file_path : String)
      unless File.exists? file_path
        raise ArgumentError.new "File does not exists: #{file_path}"
      end
      @file_path = file_path
    end
  end
end
