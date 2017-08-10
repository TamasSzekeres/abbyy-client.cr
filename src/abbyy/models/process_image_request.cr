require "./base_request"
require "./file_body"

module Abbyy::Models
  # Request object for '/processImage' API-method.
  #
  # **See** [http://ocrsdk.com/documentation/apireference/processImage/](http://ocrsdk.com/documentation/apireference/processImage/).
  class ProcessImageRequest < BaseRequest
    include FileBody

    property language : (Language | Array(Language))? = nil
    property profile : Profile? = nil
    property text_type : (TextType | Array(TextType))? = nil
    property image_source : ImageSource? = nil
    property correct_orientation : Bool? = nil
    property correct_skew : Bool? = nil
    property read_barcodes : Bool? = nil
    property export_format : (ExportFormat | Array(ExportFormat))? = nil
    property xml_write_recognition_variants : Bool? = nil
    property pdf_write_tags : PdfWriteTag? = nil
    property description : String? = nil
    property pdf_password : String? = nil

    ALLOWED_PROFILES = Profile.values - [Profile::FieldLevelRecognition]

    ALLOWED_TEXT_TYPES = TextType.values - [Profile::Handprinted]

    ALLOWED_EXPORT_FORMATS = ExportFormat.values - [
      ExportFormat::V_Card,
      ExportFormat::Csv
    ]

    def params : Hash(String, String)
      hash = {} of String => String
      case @language
      when Language
        hash["language"] = @language.to_s
      when Array(Language)
        hash["language"] = @language.as(Array(Language)).map(&.to_s).join(",")
      end
      hash["profile"] = @profile.to_s if @profile
      case @text_type
      when TextType
        hash["textType"] = @text_type.to_s
      when Array(TextType)
        hash["textType"] = @text_type.as(Array(TextType)).map(&.to_s).join(",")
      end
      hash["imageSource"] = @image_source.to_s if @image_source
      hash["correctOrientation"] = @correct_orientation.to_s if @correct_orientation
      hash["correctSkew"] = @correct_skew.to_s if @correct_skew
      hash["readBarcodes"] = @read_barcodes.to_s if @read_barcodes
      case @export_format
      when ExportFormat
        hash["exportFormat"] = @export_format.to_s
      when Array(ExportFormat)
        hash["exportFormat"] = @export_format.as(Array(ExportFormat)).map(&.to_s).join(",")
      end
      hash["xml:writeRecognitionVariants"] = @xml_write_recognition_variants.to_s if @xml_write_recognition_variants
      hash["pdf:writeTags"] = @pdf_write_tags.to_s if @pdf_write_tags
      hash["description"] = @description.to_s if @description
      hash["pdfPassword"] = @pdf_password.to_s if @pdf_password
      hash
    end
  end
end
