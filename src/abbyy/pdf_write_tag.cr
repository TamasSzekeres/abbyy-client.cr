module Abbyy
  enum PdfWriteTag
    # Automatic selection: the tags are written into the output PDF file if it must comply with PDF/A-1a standard,
    # and are not written otherwise.
    Auto

    Write

    DontWrite

    def to_s
      case self
      when Auto      then "auto"
      when Write     then "write"
      when DontWrite then "dontWrite"
      end
    end
  end
end
