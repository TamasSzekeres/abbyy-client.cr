module Abbyy
  enum ImageSource
    # The image source is detected automatically.
    Auto

    Photo

    Scanner

    def to_s
      super.to_s.downcase
    end
  end
end
