module Abbyy
  enum CheckmarkType
    # Checkmark in a circle.
    Circle

    # Checkmark against an empty background.
    Empty

    # Checkmark in a square.
    Square

    def to_s
      self.downcase
    end
  end
end
