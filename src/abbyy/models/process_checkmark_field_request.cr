require "./base_request"
require "./file_body"
require "./region"

module Abbyy::Models
  # Request object for '/processCheckmarkField' API-method.
  #
  # **See** [http://ocrsdk.com/documentation/apireference/processCheckmarkField/](http://ocrsdk.com/documentation/apireference/processCheckmarkField/).
  class ProcessCheckmarkFieldRequest < BaseRequest
    include FileBody

    property region : Region? = nil
    property checkmark_type : (CheckmarkType | Array(CheckmarkType))? = nil
    property correction_allowed : Bool? = nil
    property description : String? = nil
    property pdf_password : String? = nil

    def region=(coordinates : Array(Int32))
      @region = Region.new coordinates
    end

    def params : Hash(String, String)
      hash = {} of String => String
      hash["region"] = @region.to_s if @region
      case @checkmark_type
      when CheckmarkType
        hash["checkmarkType"] = @checkmark_type.to_s
      when Array(CheckmarkType)
        hash["checkmarkType"] = @checkmark_type.as(Array(CheckmarkType)).map(&.to_s).join(",")
      end
      hash["correctionAllowed"] = @correction_allowed.to_s if @correction_allowed
      hash["description"] = @description.to_s if @description
      hash["pdfPassword"] = @pdf_password.to_s if @pdf_password
    end
  end
end
