require "http/params"

require "./base_request"

module Abbyy::Models
  # Request object for [/listTasks](http://ocrsdk.com/documentation/apireference/listTasks/) API-method.
  class ListTasksRequest < BaseRequest
    TIME_FORMAT = "%Y-%m-%dT%H:%M:%SZ"

    # Specifies the date to list tasks from.
    #
    # This parameter is **not required**.
    #
    # Default value is the current date minus 7 days.
    property from_date : Time? = nil

    # Specifies the date to list tasks to.
    #
    # This parameter is **not required**.
    #
    # Default value is the current date.
    property to_date : Time? = nil

    # Specifies if the tasks that have already been deleted must be excluded from the listing.
    #
    # This parameter is **not required**.
    #
    # Default value is **false**.
    property exclude_deleted : Bool? = nil

    def initialize(@from_date : Time? = nil, @to_date : Time? = nil, @exclude_deleted : Bool? = nil)
    end

    def params : Hash(String, String)
      hash = {} of String => String
      hash["fromDate"] = @from_date.as(Time).to_s(TIME_FORMAT) if @from_date.is_a?(Time)
      hash["toDate"] = @to_date.as(Time).to_s(TIME_FORMAT) if @to_date.is_a?(Time)
      hash["excludeDeleted"] = @exclude_deleted.to_s if @exclude_deleted.is_a?(Bool)
      hash
    end
  end
end
