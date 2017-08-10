require "./base_model"

module Abbyy::Models
  # Region.
  class Region < BaseModel
    # Left coordinate in pixels.
    property left : Int32 = -1

    # Top coordinate in pixels.
    property top : Int32 = -1

    # Right coordinate in pixels.
    property right : Int32 = -1

    # Bottom coordinate in pixels.
    property bottom : Int32 = -1

    def initialize
    end

    def initialize(@left : Int32 = -1, @top : Int32 = -1, @right : Int32 = -1, @bottom : Int32 = -1)
    end

    # Constructs a `Region` object from the given (indexed) array.
    def initialize(coordinates : Array(Int32))
      if coordinates.size != 4
        raise ArgumentError.new("Region must give 4 coordinates!")
      end
      @left = coordinates[0]
      @top = coordinates[1]
      @right = coordinates[2]
      @bottom = coordinates[3]
    end

    # Return the coordinates in an array.
    def to_a : Array(Int32)
      [@left, @top, @right, @bottom]
    end

    # Return the string representation of the region.
    def to_s : String
      to_a.join ","
    end
  end
end
