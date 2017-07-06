module Abbyy
  enum Country
    UK
    USA
    Australia
    Canada
    Japan
    Germany
    Italy
    France
    Brazil
    Russia
    China
    Korea
    Netherlands
    Spain
    Singapore
    Taiwan

    def to_s
      self.downcase
    end
  end
end
