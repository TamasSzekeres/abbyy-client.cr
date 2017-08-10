require "./base_request"
require "./file_body"

module Abbyy::Models
  # Request object for `/processBusinessCard` API-method.
  #
  # **See** [http://ocrsdk.com/documentation/apireference/processBusinessCard/](http://ocrsdk.com/documentation/apireference/processBusinessCard/).
  class ProcessBusinessCardRequest < BaseRequest
    include FileBody

    property language : (Language | Array(Language))? = nil
    property image_source : ImageSource? = nil
    property correct_orientation : Bool? = nil
    property correct_skew : Bool? = nil
    property export_format : (ExportFormat | Array(ExportFormat))? = nil
    property xml_write_extended_character_info : Bool? = nil
    property pdf_write_field_components : Bool? = nil
    property description : String? = nil
    property pdf_password : String? = nil

    ALLOWED_EXPORT_FORMATS = [
      ExportFormat::V_Card,
      ExportFormat::Csv,
      ExportFormat::Xml
    ]

    def params : Hash(String, String)
      hash = {} of String => String
      case @language
      when Language
        hash["language"] = @language.to_s
      when Array(Language)
        hash["language"] = @language.as(Array(Language)).map(&.to_s).join(",")
      end
      hash["imageSource"] = @image_source.to_s if @image_source
      hash["correctOrientation"] = @correct_orientation.to_s if @correct_orientation
      hash["correctSkew"] = @correct_skew.to_s if @correct_skew
      case @export_format
      when ExportFormat
        hash["exportFormat"] = @export_format.to_s
      when Array(ExportFormat)
        hash["exportFormat"] = @export_format.as(Array(ExportFormat)).map(&.to_s).join(",")
      end
      hash["xml:writeExtendedCharacterInfo"] = @xml_write_extended_character_info.to_s if @xml_write_extended_character_info
      hash["pdf:writeFieldComponents"] = @pdf_write_field_components.to_s if @pdf_write_field_components
      hash["description"] = @description.to_s if @description
      hash["pdfPassword"] = @pdf_password.to_s if @pdf_password
      hash
    end
  end
end
