require "./base_request"
require "./file_body"

module Abbyy::Models
  # Request object for [/processBusinessCard](http://ocrsdk.com/documentation/apireference/processBusinessCard/) API-method.
  class ProcessBusinessCardRequest < BaseRequest
    include FileBody

    DEFAULT_LANGUAGE                          = Language::English
    DEFAULT_IMAGE_SOURCE                      = ImageSource::Auto
    DEFAULT_CORRECT_ORIENTATION               = true
    DEFAULT_CORRENT_SKEW                      = true
    DEFAULT_EXPORT_FORMAT                     = ExportFormat::V_Card
    DEFAULT_XML_WRITE_EXTENDED_CHARACTER_INFO = false
    DEFAULT_PXML_WRITE_FIELD_COMPONENTS       = false
    DEFAULT_DESCRITION                        = ""
    DEFAULT_PDF_PASSWORD                      = ""

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
    # This parameter is **not required**.
    #
    # Default value is `Language::English`.
    property language : (Language | Array(Language))? = nil

    # Specifies the source of the image. It can be either a scanned image, or a
    # photograph created with a digital camera. Special preprocessing operations
    # can be performed with the image depending on the selected source. For example,
    # the system can automatically correct distorted text lines, poor focus and lighting on photos.
    #
    # The value of this parameter can be one of the following:
    # - `ImageSource::Auto` The image source is detected automatically.
    # - `ImageSource::Photo`
    # - `ImageSource::Scanner`
    #
    # This parameter is **not required**.
    #
    # Default value is `ImageSource::Auto`.
    property image_source : ImageSource? = nil

    # Specifies whether the orientation of the image should be automatically
    # detected and corrected. It can have one of the following values:
    # - **true** The page orientation is automatically detected, and if it differs
    # from normal the image is rotated.
    # - **false** The page orientation detection and correction is not performed.
    #
    # This parameter is **not required**.
    #
    # Default value is **true**.
    property correct_orientation : Bool? = nil

    # Specifies whether the skew of the image should be automatically detected
    # and corrected. It can have either **true** or **false** value.
    #
    # This parameter is **not required**.
    #
    # Default value is **true**.
    property correct_skew : Bool? = nil

    # Specifies the export format. It can be one of the following:
    # - `ExportFormat::V_Card`
    # - `ExportFormat::Csv`
    # - `ExportFormat::Xml`
    #
    # This parameter is **not required**.
    #
    # Default value is `ExportFormat::Xml`.
    getter export_format : ExportFormat? = nil

    # Specifies whether the additional information on the recognized characters
    # (e.g. whether the character is recognized uncertainly) should be written
    # to an output file in XML format. This parameter can be used only if the
    # `export_format` parameter is set to xml.
    # The parameter can have one of the following values:
    # - **true**
    # - **false**
    #
    # This parameter is **not required**.
    #
    # Default value is **false**.
    property xml_write_extended_character_info : Bool? = nil

    # Specifies whether the field components should be written to an output file
    # in XML format. For example, for the **Name** field the components can
    # include first name and last name, returned separately.
    #
    # This parameter can be used only if the `export_format` parameter is set
    # to xml. The parameter can have one of the following values:
    # - **true**
    # - **false**
    #
    # This parameter is **not required**.
    #
    # Default value is **false**.
    property pdf_write_field_components : Bool? = nil

    # Contains the description of the processing task.
    # Cannot contain more than 255 characters.
    #
    # This parameter is **not required**.
    getter description : String? = nil

    # Contains a password for accessing password-protected images in PDF format.
    property pdf_password : String? = nil

    def initialize(file_path : String)
      set_file_path file_path
    end

    def initialize(file_path : String,
                   @language : (Language | Array(Language))? = nil,
                   @image_source : ImageSource? = nil,
                   @correct_orientation : Bool? = nil,
                   @correct_skew : Bool? = nil,
                   export_format : ExportFormat? = nil,
                   @xml_write_extended_character_info : Bool? = nil,
                   @pdf_write_field_components : Bool? = nil,
                   description : String? = nil,
                   @pdf_password : String? = nil)
      unless File.exists? file_path
        raise ArgumentError.new "File does not exists: #{file_path}"
      end
      @file_path = file_path
      set_export_format export_format
      set_description description
    end

    private def set_file_path(file_path : String)
      unless File.exists? file_path
        raise ArgumentError.new "File does not exists: #{file_path}"
      end
      @file_path = file_path
    end

    ALLOWED_EXPORT_FORMATS = [
      ExportFormat::V_Card,
      ExportFormat::Csv,
      ExportFormat::Xml,
    ]

    def export_format=(export_format : (ExportFormat | Array(ExportFormat))?)
      set_export_format
    end

    private def set_export_format(export_format : (ExportFormat | Array(ExportFormat))?)
      if export_format
        unless ALLOWED_EXPORT_FORMATS.includes? export_format
          raise ArgumentError.new "Invalid export-format: #{export_format}"
        end
      end
      @export_format = export_format
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
      case @language
      when Language
        hash["language"] = @language.to_s
      when Array(Language)
        hash["language"] = @language.as(Array(Language)).uniq.map(&.to_s).join(",")
      end
      hash["imageSource"] = @image_source.to_s if @image_source
      hash["correctOrientation"] = @correct_orientation.to_s if @correct_orientation
      hash["correctSkew"] = @correct_skew.to_s if @correct_skew
      hash["exportFormat"] = @export_format.to_s if @export_format
      hash["xml:writeExtendedCharacterInfo"] = @xml_write_extended_character_info.to_s if @xml_write_extended_character_info
      hash["pdf:writeFieldComponents"] = @pdf_write_field_components.to_s if @pdf_write_field_components
      hash["description"] = @description.to_s if @description
      hash["pdfPassword"] = @pdf_password.to_s if @pdf_password
      hash
    end
  end
end
