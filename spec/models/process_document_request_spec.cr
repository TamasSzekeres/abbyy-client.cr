require "../spec_helper"

include Abbyy
include Abbyy::Models

describe ProcessDocumentRequest do
  request = ProcessDocumentRequest.new task_id: TEST_VALID_TASK_ID

  it "raises ArgumentError when set invalid task_id" do
    expect_raises(ArgumentError) do
      ProcessDocumentRequest.new task_id: TEST_INVALID_TASK_ID
    end
    request.task_id.should_not eq(TEST_INVALID_TASK_ID)

    expect_raises(ArgumentError) do
      request.task_id = TEST_INVALID_TASK_ID
    end
    request.task_id.should_not eq(TEST_INVALID_TASK_ID)

    expect_raises(ArgumentError, "task_id must be string") do
      request.task_id = nil
    end
    request.task_id.should_not eq(nil)
  end

  it "raises ArgumentError beacause of invalid profile parameter" do
    request.profile = ProcessDocumentRequest::DEFAULT_PROFILE

    expect_raises(ArgumentError) do
      request.profile = Profile::FieldLevelRecognition
    end
    request.profile.should eq(ProcessDocumentRequest::DEFAULT_PROFILE)
  end

  it "raises ArgumentError beacause of invalid text_type parameter" do
    request.text_type = ProcessDocumentRequest::DEFAULT_TEXT_TYPE

    expect_raises(ArgumentError) do
      request.text_type = TextType::Handprinted
    end
    request.text_type.should eq(ProcessDocumentRequest::DEFAULT_TEXT_TYPE)

    expect_raises(ArgumentError) do
      request.text_type = [ProcessDocumentRequest::DEFAULT_TEXT_TYPE, TextType::Handprinted]
    end
    request.text_type.should eq(ProcessDocumentRequest::DEFAULT_TEXT_TYPE)
  end


  describe "export_format" do
    it "raises ArgumentError beacause of invalid export_format parameter" do
      [ExportFormat::V_Card, ExportFormat::Csv].each do |invalid_export_format|
        expect_raises(ArgumentError) do
          request.export_format = invalid_export_format
        end
        request.export_format.should_not eq(invalid_export_format)

        expect_raises(ArgumentError) do
          request.export_format = [invalid_export_format, ProcessDocumentRequest::DEFAULT_EXPORT_FORMAT]
        end
        request.export_format.should_not eq([invalid_export_format, ProcessDocumentRequest::DEFAULT_EXPORT_FORMAT])
      end
    end

    it "raises ArgumentError beacause of too much export_format parameter" do
      export_formats = [
        ExportFormat::Docx,
        ExportFormat::PdfSearchable,
        ExportFormat::PdfTextAndImages
      ]
      request.export_format = export_formats # ok
      request.export_format.should eq(export_formats)

      # more than 3 elements
      expect_raises(ArgumentError, "'export_format' parameter can contain up to three export formats") do
        request.export_format = export_formats + [ExportFormat::Txt]
      end
      request.export_format.should_not eq(export_formats + [ExportFormat::Txt])
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
