module Abbyy::Models
  # Response object for [/listTasks](http://ocrsdk.com/documentation/apireference/listTasks/) API-method.
  #
  # ###Status codes
  #
  # The following status codes can be returned when this method is called:
  # - **200** Successful method call.
  # - **450** Incorrect parameters have been passed. One of the following errors occurred:
  #   - The incorrect start date has been specified.
  #   - The incorrect end date has been specified.
  #   - The start date exceeds the end date.
  class ListTasksResponse < BaseResponse
    property tasks : Array(Task) = Array(Task).new

    def set_properties_from_xml(xml_data : String | IO)
      xml = XML.parse xml_data
      if response = xml.first_element_child
        response.children
        .select { |child| child.element? && child.name == "task" }
        .each { |child| tasks << Task.new child }
      end
    end
  end
end
