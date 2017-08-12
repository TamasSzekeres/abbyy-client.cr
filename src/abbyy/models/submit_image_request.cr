require "./file_body"
require "./task_id_request"

module Abbyy::Models
  # Request object for [/submitImage](http://ocrsdk.com/documentation/apireference/submitImage/) API-method.
  class SubmitImageRequest < TaskIdRequest
    include FileBody

    DEFAULT_PDF_PASSWORD = ""

    # Contains a password for accessing password-protected images in PDF format.
    #
    # This parameter is not required.
    property pdf_password : String? = nil

    def initialize(file_path : String)
      unless File.exists? file_path
        raise ArgumentError.new "File does not exists: #{file_path}"
      end
      @file_path = file_path
    end

    def initialize(file_path : String, task_id : String? = nil, @pdf_password : String? = nil)
      unless File.exists? file_path
        raise ArgumentError.new "File does not exists: #{file_path}"
      end
      if task_id.is_a? String
        raise ArgumentError.new "Invalid taskId: #{task_id}" unless task_id.as(String).is_task_id?
      end
      @file_path = file_path
    end

    def params : Hash(String, String)
      hash = super.params
      hash["pdfPassword"] = @pdf_password.to_s if @pdf_password
      hash
    end
  end
end
