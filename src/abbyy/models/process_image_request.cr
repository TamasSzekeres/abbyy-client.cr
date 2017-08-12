require "./base_request"
require "./file_body"

module Abbyy::Models
  # Request object for [/processImage](http://ocrsdk.com/documentation/apireference/processImage/) API-method.
  class ProcessImageRequest < BaseRequest
    include FileBody

    DEFAULT_LANGUAGE = Language::English
    DEFAULT_PROFILE = Profile::DocumentConversion
    DEFAULT_TEXT_TYPE = TextType::Normal
    DEFAULT_IMAGE_SOURCE = ImageSource::Auto
    DEFAULT_CORRECT_ORIENTATION = true
    DEFAULT_CORRENT_SKEW = true
    DEFAULT_READ_BARCODES = true
    DEFAULT_EXPORT_FORMAT = ExportFormat::Rtf
    DEFAULT_XML_WRITE_RECOGNITION_VARIANTS = false
    DEFAULT_PDF_WRITE_TAGS = PdfWriteTag::Auto
    DEFAULT_DESCRITION = ""
    DEFAULT_PDF_PASSWORD = ""

    # Specifies recognition language of the document. This parameter can contain
    # one language or several languages in an array,
    # for example:
    # ```
    # request.language = Language::Spanish
    # # or
    # request.language = [
    #   Language::English,
    #   Language::French,
    #   Language::German
    # ]
    # ```
    # See the [list of available recognition languages](http://ocrsdk.com/documentation/specifications/recognition-languages/).
    #
    # This parameter is **not required**.
    #
    # Default value is `Language::English`.
    property language : (Language | Array(Language))? = nil

    # Specifies a [profile](http://ocrsdk.com/documentation/specifications/processing-profiles/)
    # with predefined processing settings. It can be one of the following:
    # - `Profile::DocumentConversion`
    # - `Profile::DocumentArchiving`
    # - `Profile::TextExtraction`
    # - `Profile::BarcodeRecognition`
    #
    # This parameter is **not required**.
    #
    # Default value is `Profile::DocumentConversion`.
    getter profile : Profile? = nil

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

    # Specifies whether barcodes must be detected on the image, recognized and
    # exported to the result file. It can have either **true** or **false** value.
    #
    # This parameter is **not required**.
    #
    # Default value is **true** for Xml export format and **false** in other cases.
    property read_barcodes : Bool? = nil

    # Specifies the export format. This parameter can contain up to three export
    # formats, in an array for example:
    # ```
    # [ExportFormat::Pdfa, ExportFormat::Txt, ExportFormat::Xml]
    # ```
    # The available formats are:
    # - `ExportFormat::Txt` The recognized text is exported to the file line by
    # line from left to right. E.g. if the text was originally put in columns,
    # the first lines of every column will be saved, then the second lines, etc.
    # Please take into account the fact that in this format only text will be saved.
    # No images or barcodes will remain in the output file. If you want to save
    # the barcode recognition results in the exported file,
    # use the `ExportFormat::TxtUnstructured` format.
    # - `ExportFormat::TxtUnstructured` The exported file contains the text that
    # was saved according to the order of the original blocks.
    # - `ExportFormat::Rtf`
    # - `ExportFormat::Docx`
    # - `ExportFormat::Xlsx`
    # - `ExportFormat::Pptx`
    # - `ExportFormat::PdfSearchable` The entire image is saved as a picture,
    # the recognized text is put under it.
    # - `ExportFormat::PdfTextAndImages` The recognized text is saved as text,
    # and the pictures are saved as pictures.
    # - `ExportFormat::Pdfa The file is saved in the PDF/A-1b format, with the
    # entire image saved as a picture, and recognized text put under it.
    # - `ExportFormat::Xml`
    # - `ExportFormat::XmlForCorrectedImage The same as Xml, but all coordinates
    # written into the output XML file relate to the corrected image, not the original.
    # - `ExportFormat::Alto`
    #
    # If either of XML export formats is selected, barcodes
    # are recognized on the image and saved to output XML
    # no matter which profile is used for recognition.
    #
    # Please note that setting multiple export formats does not affect the cost of task processing.
    #
    # This parameter is **not required**.
    #
    # Default value is `ExportFormat::Rtf`.
    getter export_format : (ExportFormat | Array(ExportFormat))? = nil

    # Specifies whether the variants of characters recognition should be written
    # to an output file in XML format. This parameter can be used only if the
    # `export_format` parameter contains `ExportFormat::Xml` value.
    # The parameter can have one of the following values:
    # - **true**
    # - **false**
    property xml_write_recognition_variants : Bool? = nil

    # Specifies whether the result must be written as tagged PDF. This parameter
    # can be used only if the exportFormat parameter contains one of the values
    # for export to PDF. It can have one of the following values:
    # - `PdfWriteTag::Auto` Automatic selection: the tags are written into the
    # output PDF file if it must comply with PDF/A-1a standard, and are not written otherwise.
    # - `PdfWriteTag::Write`
    # - `PdfWriteTag::DontWrite`
    #
    # This parameter is **not required**.
    #
    # Default value is `PdfWriteTag::Auto`.
    property pdf_write_tags : PdfWriteTag? = nil

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
      unless File.exists? file_path
        raise ArgumentError.new "File does not exists: #{file_path}"
      end
      @file_path = file_path
    end

    ALLOWED_PROFILES = Profile.values - [Profile::FieldLevelRecognition]

    ALLOWED_TEXT_TYPES = TextType.values - [TextType::Handprinted]

    ALLOWED_EXPORT_FORMATS = ExportFormat.values - [
      ExportFormat::V_Card,
      ExportFormat::Csv
    ]

    def profile=(profile : Profile?)
      if profile
        unless ALLOWED_PROFILES.includes? profile
          raise ArgumentError.new "Invalid profile: #{profile}"
        end
      end
      @profile = profile
    end

    def text_type=(text_type : (TextType | Array(TextType))?)
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

    def export_format=(export_format : (ExportFormat | Array(ExportFormat))?)
      case export_format
      when ExportFormat
        unless ALLOWED_EXPORT_FORMATS.includes? export_format
          raise ArgumentError.new "Invalid export-format: #{export_format}"
        end
      when Array(ExportFormat)
        export_format.each do |ef|
          unless ALLOWED_EXPORT_FORMATS.includes? ef
            raise ArgumentError.new "Invalid export-format: #{ef}"
          end
        end
        if export_format.uniq.size > 3
          raise ArgumentError.new "'export_format' parameter can contain up to three export formats"
        end
      end
      @export_format = export_format
    end

    def description=(description : String?)
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
      hash["profile"] = @profile.to_s if @profile
      case @text_type
      when TextType
        hash["textType"] = @text_type.to_s
      when Array(TextType)
        hash["textType"] = @text_type.as(Array(TextType)).uniq.map(&.to_s).join(",")
      end
      hash["imageSource"] = @image_source.to_s if @image_source
      hash["correctOrientation"] = @correct_orientation.to_s if @correct_orientation
      hash["correctSkew"] = @correct_skew.to_s if @correct_skew
      hash["readBarcodes"] = @read_barcodes.to_s if @read_barcodes
      case @export_format
      when ExportFormat
        hash["exportFormat"] = @export_format.to_s
      when Array(ExportFormat)
        hash["exportFormat"] = @export_format.as(Array(ExportFormat)).uniq.map(&.to_s).join(",")
      end
      hash["xml:writeRecognitionVariants"] = @xml_write_recognition_variants.to_s if @xml_write_recognition_variants
      hash["pdf:writeTags"] = @pdf_write_tags.to_s if @pdf_write_tags
      hash["description"] = @description.to_s if @description
      hash["pdfPassword"] = @pdf_password.to_s if @pdf_password
      hash
    end
  end
end
