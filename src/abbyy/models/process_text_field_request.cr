require "./base_request"
require "./file_body"
require "./region"

module Abbyy::Models
  # Request object for [/processTextField](http://ocrsdk.com/documentation/apireference/processTextField/) API-method.
  class ProcessTextFieldRequest < BaseRequest
    include FileBody

    DEFAULT_REGION                 = Region.new(-1, -1, -1, -1)
    DEFAULT_LANGUAGE               = Language::English
    DEFAULT_LETTER_SET             = ""
    DEFAULT_REG_EXP                = ""
    DEFAULT_TEXT_TYPE              = TextType::Normal
    DEFAULT_ONE_TEXT_LINE          = false
    DEFAULT_ONE_WORD_PER_TEXT_LINE = false
    DEFAULT_MARKING_TYPE           = FieldMarkingType::SimpleText
    DEFAULT_PLACEHOLDERS_COUNT     = 1
    DEFAULT_WRITING_STYLE          = WritingStyle::Default
    DEFAULT_DESCRIPTION            = ""
    DEFAULT_PASSWORD               = ""

    # Specifies the region of the text field on the image. The coordinates of
    # the region are measured in pixels relative to the left top corner of the
    # image and are specified in the following order: left, top, right, bottom.
    # By default, the region of the whole image is used.
    #
    # This parameter is **not required**.
    #
    # Default value is `Region.new(-1, -1, -1, -1)`.
    property region : Region? = nil

    # Specifies recognition language of the document. This parameter can contain
    # one language or several languages in an array,
    # for example:
    # ```
    # request.language = Language::Spanish
    # # or
    # request.language = [
    #   Language::English,
    #   Language::French,
    #   Language::German,
    # ]
    # ```
    # See the [list of available recognition languages](http://ocrsdk.com/documentation/specifications/recognition-languages/).
    #
    # Note that not all languages are available for handprint recognition.
    # The languages which are available for handprint recognition are marked with a special comment.
    #
    # This parameter is **not required**.
    #
    # Default value is `Language::English`.
    property language : (Language | Array(Language))? = nil

    # Specifies the letter set, which should be used during recognition.
    # Contains a string with the letter set characters. For example,
    # `"ABCDabcd'-."`. By default, the letter set of the language, specified in
    # the language parameter, is used.
    #
    # This parameter is **not required**.
    property letter_set : String? = nil

    # Specifies the regular expression which defines which words are allowed in
    # the field and which are not. See the description of
    # [regular expressions](http://ocrsdk.com/documentation/specifications/regular-expressions/).
    # By default, the set of allowed words is defined by the dictionary of the
    # language, specified in the `language` parameter.
    #
    # Note that regular expressions do not strictly limit the set of characters
    # of the output result, i.e. the recognized value may contain characters
    # which are not included into the regular expression. During recognition all
    # hypotheses of a word recognition are checked against the specified regular
    # expression. If a given recognition variant conforms to the expression, it
    # has higher probability of being selected as final recognition output. But
    # if there is no variant that matches regular expression, the result will
    # not conform to the expression. If you want to limit the set of characters,
    # which can be recognized, the best way to do it is to use `letterSet` parameter.
    #
    # This parameter is **not required**.
    property reg_exp : String? = nil

    # Specifies the type of the text on a page. This parameter may also contain
    # several [text types](http://ocrsdk.com/documentation/specifications/text-types/)
    # in an array, for example:
    # ```
    # [TextType::Normal, TextType::Matrix]
    # ```
    # The following values can be used:
    # - TextType::Normal
    # - TextType::Typewriter
    # - TextType::Matrix
    # - TextType::Index
    # - TextType::OcrA
    # - TextType::OcrB
    # - TextType::E13b
    # - TextType::Cmc7
    # - TextType::Gothic
    #
    # This parameter is **not required**.
    #
    # Default value is `TextType::Normal`.
    getter text_type : (TextType | Array(TextType))? = nil

    # Specifies whether the field contains only one text line. The value should
    # be **true**, if there is one text line in the field; otherwise it should be **false**.
    #
    # This parameter is **not required**.
    #
    # Default value is *false*.
    property one_text_line : Bool? = nil

    # Specifies whether the field contains only one word in each text line.
    # The value should be **true**, if no text line contains more than one word
    # (so the lines of text will be recognized as a single word); otherwise it should be **false**.
    #
    # This parameter is **not required**.
    #
    # Default value is *false*.
    property one_word_per_text_line : Bool? = nil

    # This property is valid only for the handprint recognition. Specifies the
    # type of [marking around letters](http://ocrsdk.com/documentation/specifications/field-marking/)
    # (for example, underline, frame, box, etc.). By default, there is no
    # marking around letters. The value can be one of the following:
    # - `FieldMarkingType::SimpleText`
    # - `FieldMarkingType::UnderlinedText`
    # - `FieldMarkingType::TextInFrame`
    # - `FieldMarkingType::GreyBoxes`
    # - `FieldMarkingType::CharBoxSeries`
    # - `FieldMarkingType::SimpleComb`
    # - `FieldMarkingType::CombInFrame`
    # - `FieldMarkingType::PartitionedFrame`
    #
    # **Note**: For correct handprint recognition specify the value of the
    # `placeholders_count` parameter.
    #
    # This parameter is **not required**.
    #
    # Default value is `FieldMarkingType::SimpleText`.
    property marking_type : FieldMarkingType? = nil

    # Specifies the number of character cells for the field.
    #
    # This property has a sense only for the field marking types
    # (the `marking_type` parameter) that imply splitting the text in cells.
    #
    # Default value for this property is 1, but you should set the appropriate
    # value to recognize the text correctly.
    # `placeholders_count` parameter.
    #
    # This parameter is **not required**.
    property placeholders_count : Int32? = nil

    # Provides additional information about handprinted letters writing style.
    #
    # This parameter is **not required**.
    #
    # Default value is `WritingStyle::Default`.
    property writing_style : WritingStyle? = nil

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
                   @language : (Language | Array(Language))? = nil,
                   @letter_set : String? = nil,
                   @reg_exp : String? = nil,
                   text_type : (TextType | Array(TextType))? = nil,
                   @one_text_line : Bool? = nil,
                   @one_word_per_text_line : Bool? = nil,
                   @marking_type : FieldMarkingType? = nil,
                   @placeholders_count : Int32? = nil,
                   @writing_style : WritingStyle? = nil,
                   description : String? = nil,
                   @pdf_password : String? = nil)
      unless File.exists? file_path
        raise ArgumentError.new "File does not exists: #{file_path}"
      end
      @file_path = file_path
      set_text_type text_type
      set_description description
    end

    private def set_file_path(file_path : String)
      unless File.exists? file_path
        raise ArgumentError.new "File does not exists: #{file_path}"
      end
      @file_path = file_path
    end

    ALLOWED_TEXT_TYPES = TextType.values - [TextType::Handprinted]

    def region=(coordinates : Array(Int32))
      @region = Region.new coordinates
    end

    def text_type=(text_type : (TextType | Array(TextType))?)
      set_text_type text_type
    end

    private def set_text_type(text_type : (TextType | Array(TextType))?)
      case text_type
      when TextType
        unless ALLOWED_TEXT_TYPES.includes? text_type
          raise ArgumentError.new "Invalid text-type: #{text_type}"
        end
      when Array(TextType)
        text_type.each do |tt|
          unless ALLOWED_TEXT_TYPES.includes? tt
            raise ArgumentError.new "Invalid text-type: #{tt}"
          end
        end
      end
      @text_type = text_type
    end

    def description=(description : String?)
      set_description description
    end

    private def set_description(description : String?)
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
      case @language
      when Language
        hash["language"] = @language.to_s
      when Array(Language)
        hash["language"] = @language.as(Array(Language)).uniq.map(&.to_s).join(",")
      end
      hash["letterSet"] = @letter_set.to_s if @letter_set
      hash["regExp"] = @reg_exp.to_s if @reg_exp
      case @text_type
      when TextType
        hash["textType"] = @text_type.to_s
      when Array(TextType)
        hash["textType"] = @text_type.as(Array(TextType)).uniq.map(&.to_s).join(",")
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
