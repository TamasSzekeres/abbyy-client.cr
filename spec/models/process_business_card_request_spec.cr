require "../spec_helper"

include Abbyy
include Abbyy::Models

describe ProcessBusinessCardRequest do
  request = ProcessBusinessCardRequest.new file_path: TEST_VALID_FILE_PATH

  it "raises ArgumentError because of invalid filepath" do
    expect_raises(ArgumentError) do
      ProcessBusinessCardRequest.new file_path: TEST_INVALID_FILE_PATH
    end
    request.file_path.should_not eq(TEST_INVALID_FILE_PATH)

    expect_raises(ArgumentError) do
      request.file_path = TEST_INVALID_FILE_PATH
    end
    request.file_path.should_not eq(TEST_INVALID_FILE_PATH)
  end

  describe "export_format" do
    it "raises ArgumentError when set invalid export_format" do
      invalid_export_formats = ExportFormat.values - ProcessBusinessCardRequest::ALLOWED_EXPORT_FORMATS
      invalid_export_formats.each do |invalid_export_format|
        expect_raises(ArgumentError) do
          request.export_format = invalid_export_format
        end
        request.export_format.should_not eq(invalid_export_format)
      end
    end
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
