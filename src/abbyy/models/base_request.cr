require "http/client"

require "./base_model"

module Abbyy::Models
  class BaseRequest < BaseModel
    def params : Hash(String, String)
      {} of String => String
    end

    def body : HTTP::Client::BodyType
      nil
    end
  end
end
