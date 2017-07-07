module Abbyy
  enum TextType
    # Common typographic type of text.
    Normal

    # The text is typed on a typewriter.
    Typewriter

    # The text is printed on a dot-matrix printer.
    Matrix

    # A special set of characters including only digits written in ZIP-code style.
    Index

    # Handprinted text.
    Handprinted

    # A monospaced font, designed for Optical Character Recognition.
    # Largely used by banks, credit card companies and similar businesses.
    OcrA

    # A font designed for Optical Character Recognition.
    OcrB

    # A special set of characters including only digits and A, B, C, D characters printed in magnetic ink.
    # MICR (Magnetic Ink Character Recognition) characters are found in a variety of places, including personal checks.
    E13B

    # A special set of characters, which includes only digits and A, B, C, D, E characters,
    # written in MICR barcode font (CMC-7).
    CMC7

    # Text printed in Gothic type.
    Gothic

    def to_s
      case self
      when OcrA then "ocrA"
      when OcrB then "ocrB"
      else
        self.downcase
      end
    end
  end
end
