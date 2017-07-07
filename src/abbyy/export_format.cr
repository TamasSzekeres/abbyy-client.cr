module Abbyy
  enum ExportFormat
    # The recognized text is exported to the file line by line from left to right.
    # E.g. if the text was originally put in columns, the first lines of every column will be saved,
    # then the second lines, etc.
    #
    # Please take into account the fact that in this format only text will be saved.
    # No images or barcodes will remain in the output file.
    # If you want to save the barcode recognition results in the exported file, use the TXT_UNSTRUCTURED format.
    Txt

    # The exported file contains the text that was saved according to the order of the original blocks.
    TxtUnstructured

    Rtf

    Docx

    Xlsx

    Pptx

    # The entire image is saved as a picture, the recognized text is put under it.
    PdfSearchable

    # The recognized text is saved as text, and the pictures are saved as pictures.
    PdfTextAndImages

    # The file is saved in the PDF/A-1b format, with the entire image saved as a picture,
    # and recognized text put under it.
    Pdfa

    # All coordinates are saved relative to the original image.
    #
    # See Output XML Document for the description of tags. If you select this export format, barcodes are
    # recognized on the image and saved to output XML no matter which profile is used for recognition.
    Xml

    # The same as xml, but all coordinates written into the output XML file relate to the corrected image,
    # not the original.
    XmlForCorrectedImage

    Alto

    # This format is only available with the processBusinessCard method.
    V_Card

    # This format is only available with the processBusinessCard method.
    Csv

    def to_s
      case self
      when Txt                  then "txt"
      when TxtUnstructured      then "txtUnstructured"
      when Rtf                  then "rtf"
      when Docx                 then "docx"
      when Xlsx                 then "xlsx"
      when Pptx                 then "pptx"
      when PdfSearchable        then "pdfSearchable"
      when PdfTextAndImages     then "pdfTextAndImages"
      when Pdfa                 then "pdfa"
      when Xml                  then "xml"
      when XmlForCorrectedImage then "xmlForCorrectedImage"
      when Alto                 then "alto"
      when V_Card               then "vCard"
      when Csv                  then "csv"
      end
    end
  end
end
