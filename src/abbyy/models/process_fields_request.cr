require "./file_body"
require "./task_id_request"

module Abbyy::Models
  # Request object for [/processFields](http://ocrsdk.com/documentation/apireference/processFields/) API-method.
  class ProcessFieldsRequest < TaskIdRequest
    include FileBody

    DEFAULT_DESCRIPTION                = ""
    DEFAULT_WRITE_RECOGNITION_VARIANTS = false

    # Contains the description of the processing task.
    # Cannot contain more than 255 characters.
    #
    # This parameter is **not required**.
    getter description : String? = nil

    # Specifies whether the recognition variants should be written to the result.
    # It can have either **true** or **false** value.
    #
    # If you set this value to **true**, additional recognition variants
    # (charRecVariants) appear in the XML result file.
    #
    # This parameter is **not required**.
    #
    # Default value is **false**.
    property write_recognition_variants : Bool? = nil

    def initialize(task_id : String, file_path : String)
      set_task_id task_id
      set_file_path file_path
    end

    def initialize(task_id : String, file_path : String,
                   description : String? = nil,
                   @write_recognition_variants : Bool? = nil)
      set_task_id task_id
      unless File.exists? file_path
        raise ArgumentError.new "File does not exists: #{file_path}"
      end
      @file_path = file_path
      set_description description
    end

    def task_id=(task_id : String?)
      set_task_id task_id
    end

    private def set_task_id(task_id : String?)
      if task_id.is_a?(String)
        raise ArgumentError.new "Invalid taskId: #{task_id}" unless task_id.as(String).is_task_id?
      else
        raise ArgumentError.new "task_id must be string"
      end
      @task_id = task_id
    end

    private def set_file_path(file_path : String)
      unless File.exists? file_path
        raise ArgumentError.new "File does not exists: #{file_path}"
      end
      @file_path = file_path
    end

    def description=(description : String?)
      set_description description
    end

    def set_description(description : String?)
      if description.is_a? String
        if description.as(String).size > 255
          raise ArgumentError.new "'description' parameter cannot contain more than 255 characters"
        end
      end
      @description = description
    end

    def params : Hash(String, String)
      hash = super.params
      hash["writeRecognitionVariants"] = @write_recognition_variants.to_s if @write_recognition_variants
      hash["description"] = @description.to_s if @description
      hash
    end
  end
end
