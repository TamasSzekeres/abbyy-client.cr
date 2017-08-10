require "http/client"

module Abbyy::Models
  module FileBody
    property file_path : String? = nil

    def body : HTTP::Client::BodyType
      if @file_path
        File.open @file_path.as(String)
      else
        nil
      end
    end
  end
end
