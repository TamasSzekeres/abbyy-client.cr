module Abbyy
  enum BarcodeType
    AutoDetect

    # Aztec is a high density two-dimensional matrix style bar code symbology that can encode up to 3832 digits,
    # 3067 alphanumeric characters, or 1914 bytes of data.
    # The symbol is built on a square grid with a bulls-eye pattern at its center.
    Aztec

    # Codabar is a self-checking, variable length barcode that can encode 16 data characters.
    # It is used primarily for numeric data, but also encodes six special characters.
    # Codabar is useful for encoding dollar and mathematical figures because a decimal point,
    # plus sign, and minus sign can be encoded.
    Codabar

    # Code 128 is an alphanumeric, very high-density, compact, variable length barcode scheme that can encode
    # the full 128 ASCII character set. Each character is represented by three bars and three spaces totaling 11 modules.
    # Each bar or space is one, two, three, or four modules wide with the total number of modules representing bars
    # an even number and the total number of modules representing a space an odd number. Three different start
    # characters are used to select one of three character sets.
    Code128

    # Code 39, also referred to as Code 3 of 9, is an alphanumeric, self-checking, variable length barcode that uses
    # five black bars and four spaces to define a character. Three of the elements are wide and six are narrow.
    Code39

    # Code 93 is a variable length bar code that encodes 47 characters. It is named Code 93 because every character is
    # constructed from nine elements arranged into three bars with their adjacent spaces. Code 93 is a compressed
    # version of Code 39 and was designed to complement Code 39.
    Code93

    # Data Matrix is a two-dimensional matrix barcode consisting of black and white modules arranged in either a
    # square or rectangular pattern. Every Data Matrix is composed of two solid adjacent borders in an “L” shape and
    # two other borders consisting of alternating dark and light modules. Within these borders are rows and columns
    # of cells encoding information. A Data Matrix barcode can store up to 2335 alphanumeric characters.
    DataMatrix

    # The European Article Numbering (EAN) system is used for products that require a country origin.
    # EAN8 and EAN13 are fixed-length barcodes used to encode either eight or thirteen characters.
    # The first two characters identify the country of origin, the next characters are data characters,
    # and the last character is the checksum. These barcodes may include an additional barcode to the right
    # of the main barcode. This second barcode, which is usually not as tall as the primary barcode,
    # is used to encode additional information for newspapers, books, and other periodicals.
    # The supplemental barcode may either encoded 2 or 5 digits of information.
    EAN8
    EAN13

    # IATA 2 of 5 is a barcode standard designed by the IATA (International Air Transport Association).
    # This standard is used for all boarding passes.
    IATA25

    # Industrial 2 of 5 is numeric-only barcode that has been in use a int time. Unlike Interleaved 2 of 5,
    # all of the information is encoded in the bars; the spaces are fixed width and are used only to separate the bars.
    # The code is self-checking and does not include a checksum.
    Industrial25

    # Interleaved 2 of 5 is a variable length (must be a multiple of two), high-density, self-checking,
    # numeric barcode that uses five black bars and five white bars to define a character.
    # Two digits are encoded in every character; one in the black bars and one in the white bars.
    # Two of the black bars and two of the white bars are wide. The other bars are narrow.
    Interleaved25

    # Matrix 2 of 5 is self-checking numeric-only barcode. Unlike Interleaved 2 of 5, all of the information
    # is encoded in the bars; the spaces are fixed width and are used only to separate the bars.
    # Matrix 2 of 5 is used primarily for warehouse sorting, photo finishing, and airline ticket marking.
    Matrix25

    # Patch code contains a pattern of horizontal black bars separated by spaces. Typically,
    # a patch code is placed near the top center of a paper document to be scanned and used as a document separator.
    Patch

    # PDF417 is a variable length, two-dimensional (2D), stacked symbology that can store up to 2710 digits,
    # 1850 printable ASCII characters or 1108 binary characters per symbol. PDF417 is designed with selectable
    # levels of error correction. Its high data capacity can be helpful in applications where a large amount of
    # data must travel with a labeled document or item.
    PDF417

    # The Postnet (Postal Numeric Encoding Technique) is a fixed length symbology (5, 6, 9, or 11 characters)
    # which uses constant bar and space width. Information is encoded by varying the bar height between the two values.
    # Postnet barcodes are placed on the lower right of envelopes or postcards, and are used to expedite the processing
    # of mail with automatic equipment and provide reduced postage rates.
    PostNet

    # QR Code is a two-dimensional matrix barcode. The barcode has 3 large squares (registration marks) in the corners
    # which define the top of the barcode. The black and white squares in the area between the registration marks are
    # the encoded data and error correction keys. QR Codes can encode over 4000 ASCII characters.
    QR_Code

    # This type of barcode is a 19 digit barcode with a 20th check digit. For a total of 20 digits.
    # It typically is used for carton identification. Both for internal carton numbering and also for using the
    # UCC-128 barcode on your cartons being shipped out to your customers.
    UCC_128

    # The UPC-A (Universal Product Code) barcode is 12 digits int, including its checksum.
    # Each digit is represented by a seven-bit sequence, encoded by a series of alternating bars and spaces.
    # UPC-A is used for marking products which are sold at retail in the USA.
    UPCA

    # The UPC-E barcode is a shortened version of UPC-A barcode. It compresses the data characters and the checksum
    # into six characters. This bar code is ideal for small packages because it is the smallest bar code.
    UPCE

    def to_s
      case self
      when AutoDetect    then "autodetect"
      when Aztec         then "aztec"
      when Codabar       then "codabar"
      when Code128       then "code128"
      when Code39        then "code39"
      when Code93        then "code93"
      when DataMatrix    then "dataMatrix"
      when EAN8          then "ean8"
      when EAN13         then "ean13"
      when IATA25        then "iata25"
      when Industrial25  then "industrial25"
      when Interleaved25 then "interleaved25"
      when Matrix25      then "matrix25"
      when Patch         then "patch"
      when PDF417        then "pdf417"
      when PostNet       then "postNet"
      when QR_Code       then "qrCode"
      when UCC_128       then "ucc128"
      when UPCA          then "upca"
      when UPCE          then "upce"
      end
    end
  end
end
