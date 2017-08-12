require "xml"

require "../spec_helper"

include Abbyy
include Abbyy::Models

describe Task do
  it "should initialize from xml" do
    xml_data = <<-XML
      <?xml version="1.0" encoding="utf-8"?>
      <response>
        <task id="b76b6ce9-4ad1-471a-9f19-403f7722d7a5"
          registrationTime="2017-08-10T17:50:05Z"
          statusChangeTime="2017-08-10T17:50:05Z"
          status="Queued"
          filesCount="1"
          credits="0"
          error="No error"
          description="Example request"
          resultUrl="www.result-url.com"
          resultUrl2="www.result-url-2.com"
          estimatedProcessingTime="5" />
      </response>
    XML

    xml = XML.parse xml_data
    if response = xml.first_element_child
      if task_child = response.first_element_child
        task = Task.new task_child
        task.id.should eq("b76b6ce9-4ad1-471a-9f19-403f7722d7a5")
        task.registration_time.should eq(Time.new 2017, 8, 10, 17, 50, 5)
        task.status_change_time.should eq(Time.new 2017, 8, 10, 17, 50, 5)
        task.status.should eq(TaskStatus::Queued)
        task.error.should eq("No error")
        task.files_count.should eq(1)
        task.credits.should eq(0)
        task.estimated_processing_time.should eq(5)
        task.result_url.should eq("www.result-url.com")
        task.result_url2.should eq("www.result-url-2.com")
        task.result_url3.should eq(nil)
        task.description.should eq("Example request")
      end
    end
  end
end
