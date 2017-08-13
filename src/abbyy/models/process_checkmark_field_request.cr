require "./base_request"
require "./file_body"
require "./region"

module Abbyy::Models
  # Request object for [/processCheckmarkField](http://ocrsdk.com/documentation/apireference/processCheckmarkField/) API-method.
  class ProcessCheckmarkFieldRequest < BaseRequest
    include FileBody

    DEFAULT_REGION             = Region.new(-1, -1, -1, -1)
    DEFAULT_CHECKMARK_TYPE     = CheckmarkType::Empty
    DEFAULT_CORRECTION_ALLOWED = false
    DEFAULT_DESCRIPTION        = ""
    DEFAULT_PASSWORD           = ""

    # Specifies the region of the text field on the image. The coordinates of
    # the region are measured in pixels relative to the left top corner of the
    # image and are specified in the following order: left, top, right, bottom.
    # By default, the region of the whole image is used.
    #
    # This parameter is **not required**.
    #
    # Default value is `Region.new(-1, -1, -1, -1)`.
    property region : Region? = nil

    # Specifies the type of the checkmark. It can be one of the following:
    # - `CheckmarkType::Circle` (checkmark in a circle)
    # - `CheckmarkType::Empty` (checkmark against an empty background)
    # - `CheckmarkType::Square` (checkmark in a square)
    #
    # This parameter is **not required**.
    #
    # Default value is `CheckmarkType::Empty`.
    property checkmark_type : CheckmarkType? = nil

    # This property set to true means that checkmark block can be selected and then corrected.
    #
    # This parameter is **not required**.
    #
    # Default value is **false**.
    property correction_allowed : Bool? = nil

    # Contains the description of the processing task.
    # Cannot contain more than 255 characters.
    #
    # This parameter is **not required**.
    getter description : String? = nil

    # Contains a password for accessing password-protected images in PDF format.
    #
    # This parameter is **not required**.
    property pdf_password : String? = nil

    def initialize(file_path : String)
      set_file_path file_path
    end

    def initialize(file_path : String,
                   @region : Region? = nil,
                   @checkmark_type : CheckmarkType? = nil,
                   @correction_allowed : Bool? = nil,
                   description : String? = nil,
                   @pdf_password : String? = nil)
      unless File.exists? file_path
        raise ArgumentError.new "File does not exists: #{file_path}"
      end
      @file_path = file_path
      set_description description
    end

    private def set_file_path(file_path : String)
      unless File.exists? file_path
        raise ArgumentError.new "File does not exists: #{file_path}"
      end
      @file_path = file_path
    end

    def region=(coordinates : Array(Int32))
      @region = Region.new coordinates
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
      hash = {} of String => String
      hash["region"] = @region.to_s if @region
      hash["checkmarkType"] = @checkmark_type.to_s if @checkmark_type
      hash["correctionAllowed"] = @correction_allowed.to_s if @correction_allowed
      hash["description"] = @description.to_s if @description
      hash["pdfPassword"] = @pdf_password.to_s if @pdf_password
      hash
    end
  end
end
