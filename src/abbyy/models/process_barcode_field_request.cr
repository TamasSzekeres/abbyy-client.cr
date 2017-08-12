require "./base_request"
require "./file_body"
require "./region"

module Abbyy::Models
  # Request object for [/processBarcodeField](http://ocrsdk.com/documentation/apireference/processBarcodeField/) API-method.
  class ProcessBarcodeFieldRequest < BaseRequest
    include FileBody

    DEFAULT_REGION = Region.new(-1, -1, -1, -1)
    DEFAULT_BARCODE_TYPE = BarcodeType::AutoDetect
    DEFAULT_CONTAINS_BINARY_DATA = false
    DEFAULT_DESCRIPTION = ""
    DEFAULT_PASSWORD = ""

    # Specifies the region of the text field on the image. The coordinates of
    # the region are measured in pixels relative to the left top corner of the
    # image and are specified in the following order: left, top, right, bottom.
    # By default, the region of the whole image is used.
    #
    # This parameter is **not required**.
    #
    # Default value is `Region.new(-1, -1, -1, -1)`.
    property region : Region? = nil

    # Specifies the type of the barcode. This parameter may also contain several
    # barcode types in an array, for example:
    # ```
    # [BarcodeType::Code39, BarcodeType::Code93]
    # ```
    # The following values can be used:
    # - `BarcodeType::AutoDetect`
    # - `BarcodeType::Patch`
    # - `BarcodeType::Code39`
    # - `BarcodeType::Code93`
    # - `BarcodeType::Code128`
    # - `BarcodeType::UCC_128`
    # - `BarcodeType::Interleaved25`
    # - `BarcodeType::Industrial25`
    # - `BarcodeType::IATA25`
    # - `BarcodeType::Matrix25`
    # - `BarcodeType::EAN8`
    # - `BarcodeType::EAN13`
    # - `BarcodeType::Codabar`
    # - `BarcodeType::UPCA`
    # - `BarcodeType::UPCE`
    # - `BarcodeType::PostNet`
    # - `BarcodeType::Aztec`
    # - `BarcodeType::DataMatrix`
    # - `BarcodeType::PDF417`
    # - `BarcodeType::QR_Code`
    #
    # See the description of
    # [barcode types](http://ocrsdk.com/documentation/specifications/barcode-types/) for details.
    #
    # This parameter is **not required**.
    #
    # Default value is `BarcodeType::AutoDetect`.
    property barcode_type : (BarcodeType | Array(BarcodeType))? = nil

    # This parameter makes sense only for PDF417 and *Aztec* barcodes, which
    # encode some binary data. If this parameter is set to **true**, the binary
    # data encoded in a barcode are saved as a sequence of hexadecimal
    # values for corresponding bytes.
    #
    # This parameter is **not required**.
    #
    # Default value is **false**.
    property contains_binary_data : Bool? = nil

    # Contains the description of the processing task.
    # Cannot contain more than 255 characters.
    #
    # This parameter is **not required**.
    property description : String? = nil

    # Contains a password for accessing password-protected images in PDF format.
    #
    # This parameter is **not required**.
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
        hash["barcodeType"] = @barcode_type.as(Array(BarcodeType)).uniq.map(&.to_s).join(",")
      end
      hash["containsBinaryData"] = @contains_binary_data.to_s if @contains_binary_data
      hash["description"] = @description.to_s if @description
      hash["pdfPassword"] = @pdf_password.to_s if @pdf_password
      hash
    end
  end
end
