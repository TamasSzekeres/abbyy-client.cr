require "http/client"

module Abbyy::Models
  module FileBody
    # **Required Parameter**
    property file_path : String

    def initialize(@file_path : String)
    end

    def body : HTTP::Client::BodyType
      File.open @file_path
    end
  end
end
