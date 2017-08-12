require "http/client"

module Abbyy::Models
  module FileBody
    # The path of file to send.
    #
    # **Required Parameter**
    getter file_path : String

    def initialize(file_path : String)
      unless File.exists? file_path
        raise ArgumentError.new "File does not exists: #{file_path}"
      end
      @file_path = file_path
    end

    def file_path=(file_path : String)
      unless File.exists? file_path
        raise ArgumentError.new "File does not exists: #{file_path}"
      end
      @file_path = file_path
    end

    def body : HTTP::Client::BodyType
      File.open @file_path
    end
  end
end
