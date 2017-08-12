require "./base_request"
require "./file_body"

module Abbyy::Models
  # Request object for [/processReceipt](http://ocrsdk.com/documentation/apireference/processReceipt/) API-method.
  class ProcessReceiptRequest < BaseRequest
    include FileBody

    DEFAULT_COUNTRY = Country::USA
    DEFAULT_IMAGE_SOURCE = ImageSource::Auto
    DEFAULT_CORRECT_ORIENTATION = true
    DEFAULT_CORRECT_SKEW = true
    DEFAULT_XML_WRITE_EXTENDED_CHARACTER_INFO = false
    DEFAULT_DESCRIPTION = ""
    DEFAULT_PDF_PASSWORD = ""

    # Specifies the country where the receipt was printed. This parameter can
    # contain several countries in an array, for example:
    # ```
    # [Country::Taiwan, Country::China]
    # ```
    #
    # **Important!** The technology fully supports US receipts, other countries
    # are currently supported in beta mode.
    property country : (Country | Array(Country))? = nil

    # Specifies the source of the image. It can be either a scanned image, or a
    # photograph created with a digital camera. Special preprocessing operations
    # can be performed with the image depending on the selected source.
    # For example, the system can automatically correct distorted text lines,
    # poor focus and lighting on photos.
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

    # Specifies whether the additional information on the recognized characters
    # (e.g. whether the character is recognized uncertainly) should be written
    # to an output file in XML format. The parameter can have one of the following values:
    # - **true**
    # - **false**
    #
    # This parameter is **not required**.
    #
    # Default value is **false**.
    property xml_write_extended_character_info : Bool? = nil

    # Contains the description of the processing task.
    # Cannot contain more than 255 characters.
    #
    # This parameter is **not required**.
    property description : String? = nil

    # Contains a password for accessing password-protected images in PDF format.
    #
    # This parameter is **not required**.
    property pdf_password : String? = nil

    def initialize(@file_path : String)
      unless File.exists? @file_path
        raise ArgumentError.new "File does not exists: #{@file_path}"
      end
    end

    def params : Hash(String, String)
      hash = {} of String => String
      case @country
      when Country
        hash["country"] = @country.to_s
      when Array(Country)
        hash["country"] = @country.as(Array(Country)).uniq.map(&.to_s).join(",")
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
