require "./base_request"
require "./file_body"
require "./region"

module Abbyy::Models
  # Request object for '/processBarcodeField' API-method.
  #
  # **See** [http://ocrsdk.com/documentation/apireference/processBarcodeField/](http://ocrsdk.com/documentation/apireference/processBarcodeField/).
  class ProcessBarcodeFieldRequest < BaseRequest
    include FileBody

    property region : Region? = nil
    property barcode_type : (BarcodeType | Array(BarcodeType))? = nil
    property contains_binary_data : Bool? = nil
    property description : String? = nil
    property pdf_password : String? = nil

    def region=(coordinates : Array(Int32))
      @region = Region.new coordinates
    end

    def params : Hash(String, String)
      hash = {} of String => String
      hash["region"] = @region.to_s if @region
      case @barcode_type
      when BarcodeType
        hash["barcodeType"] = @barcode_type.to_s
      when Array(BarcodeType)
        hash["barcodeType"] = @barcode_type.as(Array(BarcodeType)).map(&.to_s).join(",")
      end
      hash["containsBinaryData"] = @contains_binary_data.to_s if @contains_binary_data
      hash["description"] = @description.to_s if @description
      hash["pdfPassword"] = @pdf_password.to_s if @pdf_password
      hash
    end
  end
end
