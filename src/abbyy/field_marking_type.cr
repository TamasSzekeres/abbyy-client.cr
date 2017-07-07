module Abbyy
  enum FieldMarkingType
    # This value denotes plain text.
    SimpleText

    # This value specifies that the text is underlined.
    UnderlinedText

    # This value specifies that the text is enclosed in a frame.
    TextInFrame

    # This value specifies that the text is located in white fields on a gray background.
    GreyBoxes

    # This value specifies that the field where the text is located is a set of separate boxes.
    CharBoxSeries

    # This value specifies that the field where the text is located is a comb.
    SimpleComb

    # This value specifies that the field where the text is located is a comb and that this comb is also the bottom line of a frame.
    CombInFrame

    # This value specifies that the field where the text is located is a frame and this frame is split by vertical lines.
    PartitionedFrame

    def to_s
      case self
      when SimpleText       then "simpleText"
      when UnderlinedText   then "underlinedText"
      when TextInFrame      then "textInFrame"
      when GreyBoxes        then "greyBoxes"
      when CharBoxSeries    then "charBoxSeries"
      when SimpleComb       then "simpleComb"
      when CombInFrame      then "combInFrame"
      when PartitionedFrame then "partitionedFrame"
      end
    end
  end
end
