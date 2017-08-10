require "./base_request"
require "./file_body"
require "./region"

module Abbyy::Models
  # Request object for `/processTextField` API-method.
  #
  # **See** [http://ocrsdk.com/documentation/apireference/processTextField/](http://ocrsdk.com/documentation/apireference/processTextField/).
  class ProcessTextFieldRequest < BaseRequest
    include FileBody
    
    property region : Region? = nil
    property language : (Language | Array(Language))? = nil
    property letter_set : String? = nil
    property reg_exp : String? = nil
    property text_type : (TextType | Array(TextType))? = nil
    property one_text_line : Bool? = nil
    property one_word_per_text_line : Bool? = nil
    property marking_type : FieldMarkingType? = nil
    property placeholders_count : Int32? = nil
    property writing_style : WritingStyle? = nil
    property description : String? = nil
    property pdf_password : String? = nil

    def region=(coordinates : Array(Int32))
      @region = Region.new coordinates
    end

    def params : Hash(String, String)
      hash = {} of String => String
      hash["region"] = @region.to_s if @region
      case @language
      when Language
        hash["language"] = @language.to_s
      when Array(Language)
        hash["language"] = @language.as(Array(Language)).map(&.to_s).join(",")
      end
      hash["letterSet"] = @letter_set.to_s if @letter_set
      hash["regExp"] = @reg_exp.to_s if @reg_exp
      case @text_type
      when TextType
        hash["textType"] = @text_type.to_s
      when Array(TextType)
        hash["textType"] = @text_type.as(Array(TextType)).map(&.to_s).join(",")
      end
      hash["oneTextLine"] = @one_text_line.to_s if @one_text_line
      hash["oneWordPerTextLine"] = @one_word_per_text_line.to_s if @one_word_per_text_line
      hash["markingType"] = @marking_type.to_s if @marking_type
      hash["placeholdersCount"] = @placeholders_count.to_s if @placeholders_count
      hash["writingStyle"] = @writing_style.to_s if @writing_style
      hash["description"] = @description.to_s if @description
      hash["pdfPassword"] = @pdf_password.to_s if @pdf_password
      hash
    end
  end
end
