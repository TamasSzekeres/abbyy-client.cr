require "./base_request"
require "./file_body"

module Abbyy::Models
  # Request object for `/processReceipt` API-method.
  #
  # **See** [http://ocrsdk.com/documentation/apireference/processReceipt/](http://ocrsdk.com/documentation/apireference/processReceipt/).
  class ProcessReceiptRequest < BaseRequest
    include FileBody

    property country : (Country | Array(Country))? = nil
    property image_source : ImageSource? = nil
    property correct_orientation : Bool? = nil
    property correct_skew : Bool? = nil
    property xml_write_extended_character_info : Bool? = nil
    property description : String? = nil
    property pdf_password : String? = nil

    def params : Hash(String, String)
      hash = {} of String => String
      case @country
      when Country
        hash["country"] = @country.to_s
      when Array(Country)
        hash["country"] = @country.as(Array(Country)).map(&.to_s).join(",")
      end
      hash["imageSource"] = @image_source.to_s if @image_source
      hash["correctOrientation"] = @correct_orientation.to_s if @correct_orientation
      hash["correctSkew"] = @correct_skew.to_s if @correct_skew
      hash["xml:writeExtendedCharacterInfo"] = @xml_write_extended_character_info.to_s if @xml_write_extended_character_info
      hash["description"] = @description.to_s if @description
      hash["pdfPassword"] = @pdf_password.to_s if @pdf_password
      hash
    end
  end
end
