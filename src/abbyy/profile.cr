module Abbyy
  enum Profile
    # Suitable for converting documents into an editable format such as RTF or DOCX.
    # This profile is focused on retaining the original document structure and appearance,
    # including font styles, pictures, background color, etc.
    DocumentConversion

    # Suitable for creating a digital archive of searchable documents.
    # This profile is not intended for converting documents into an editable format.
    # It is best optimized for creating searchable PDFs (with the recognized text saved under the image).
    # All possible text is found and recognized on the input image, including text embedded into pictures.
    DocumentArchiving

    # Suitable for extracting all text from the input image, including small text areas of low quality.
    # The document appearance and structure are ignored, pictures and tables are not detected.
    #
    # This profile is not intended for converting documents into an editable format.
    # It is designed for the situations when you need to retrieve the data from the image for some
    # further processing on your side, such as extracting data from bills, receipts or invoices for
    # use in accounting systems. Consider using XML export format,
    # which allows you to access the recognized text coordinates.
    TextExtraction

    FieldLevelRecognition

    # Suitable for barcode extraction. Extracts only barcodes (texts, pictures, or tables are not detected).
    # See the list of supported [barcode types](http://ocrsdk.com/documentation/specifications/barcode-types/).
    BarcodeRecognition

    def to_s
      case self
      when DocumentConversion    then "documentConversion"
      when DocumentArchiving     then "documentArchiving"
      when TextExtraction        then "textExtraction"
      when FieldLevelRecognition then "fieldLevelRecognition"
      when BarcodeRecognition    then "barcodeRecognition"
      else
        raise "Unknown profile: #{self}"
      end
    end
  end
end
