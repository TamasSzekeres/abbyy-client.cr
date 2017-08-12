require "http/client"

require "./base_model"

module Abbyy::Models
  # Base class for Response objects.
  abstract class BaseResponse < BaseModel
    # The server can return the following HTTP status codes:
    # - 200 – successful method call
    # - 4xx – incorrect parameters of the method
    # - 5xx – an error on the server side
    property status_code : Int32 = 0

    # HTTP version.
    property protocol_version : String? = nil
    property headers : HTTP::Headers = HTTP::Headers.new

    def initialize(response : HTTP::Client::Response)
      @status_code = response.status_code
      @protocol_version = response.version
      @headers = response.headers
      if response.success?
        set_properties_from_xml response.body_io
      end
    end

    abstract def set_properties_from_xml(xml_data : String | IO)

    def success?
      @status_code == 200
    end
  end
end
