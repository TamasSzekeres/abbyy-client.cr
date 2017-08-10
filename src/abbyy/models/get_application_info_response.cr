require "http/client"
require "xml"

require "./base_response"

module Abbyy::Models
  # Response object for `/getApplicationInfo` API-method.
  #
  # **See** `Abbyy::Client::get_application_info`.
  #
  # **See** [http://ocrsdk.com/documentation/apireference/getApplicationInfo/](http://ocrsdk.com/documentation/apireference/getApplicationInfo/).
  class GetApplicationInfoResponse < BaseResponse
    TIME_FORMAT = "%Y-%m-%dT%H:%M:%S"

    property name : String = ""
    property installation_id : String? = nil
    property pages : Int32? = nil
    property fields : Int32? = nil
    property installations : Int32? = nil
    property documents : Int32? = nil
    property expires : Time? = nil
    property type : ApplicationType? = nil

    def set_properties_from_xml(xml_data : String | IO)
      xml = XML.parse xml_data
      if info = xml.first_element_child
        if application = info.first_element_child
          application.children.select(&.element?).each do |child|
            case child.name
            when "name" then @name = child.content
            when "installationId" then @installation_id = child.content
            when "pages" then @pages = child.content.to_i
            when "fields" then @fields = child.content.to_i
            when "installations" then @installations = child.content.to_i
            when "documents" then @documents = child.content.to_i
            when "expires" then @expires = Time.parse child.content, TIME_FORMAT
            when "type" then @type = ApplicationType.parse? child.content
            end
          end
        end
      end
      self
    end
  end
end
