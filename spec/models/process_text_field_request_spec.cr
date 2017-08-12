require "../spec_helper"

include Abbyy
include Abbyy::Models

describe ProcessTextFieldRequest do
  request = ProcessTextFieldRequest.new file_path: TEST_VALID_FILE_PATH

  it "raises ArgumentError because of invalid filepath" do
    expect_raises(ArgumentError) do
      ProcessTextFieldRequest.new file_path: TEST_INVALID_FILE_PATH
    end
    request.file_path.should_not eq(TEST_INVALID_FILE_PATH)

    expect_raises(ArgumentError) do
      request.file_path = TEST_INVALID_FILE_PATH
    end
    request.file_path.should_not eq(TEST_INVALID_FILE_PATH)
  end

  it "raises ArgumentError beacause of invalid text_type parameter" do
    request.text_type = ProcessTextFieldRequest::DEFAULT_TEXT_TYPE

    expect_raises(ArgumentError) do
      request.text_type = TextType::Handprinted
    end
    request.text_type.should eq(ProcessTextFieldRequest::DEFAULT_TEXT_TYPE)

    expect_raises(ArgumentError) do
      request.text_type = [ProcessTextFieldRequest::DEFAULT_TEXT_TYPE, TextType::Handprinted]
    end
    request.text_type.should eq(ProcessTextFieldRequest::DEFAULT_TEXT_TYPE)
  end

  describe "description" do
    it "can contain up to 255 characters" do
      request.description = "a" * 255
      request.description.should eq("a" * 255)
    end

    it "cannot contain more than 255 characters" do
      expect_raises(ArgumentError, "'description' parameter cannot contain more than 255 characters") do
        request.description = "a" * 256
      end
      request.description.should_not eq("a" * 256)
    end
  end
end
