module Abbyy
  enum ImageSource
    # The image source is detected automatically.
    Auto

    Photo

    Scanner

    def to_s
      self.downcase
    end
  end
end
