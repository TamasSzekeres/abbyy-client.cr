module Abbyy::Models
  # Response object for [/listTasks](http://ocrsdk.com/documentation/apireference/listTasks/) API-method.
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
