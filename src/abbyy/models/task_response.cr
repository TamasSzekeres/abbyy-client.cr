require "./task"

module Abbyy::Models
  # Response object for API-methods returning only task.
  class TaskResponse < BaseResponse
    property task : Task? = nil

    def set_properties_from_xml(xml_data : String | IO)
      xml = XML.parse xml_data
      if response = xml.first_element_child
        if task_child = response.first_element_child
          @task = Task.new task_child
        end
      end
    end
  end
end
