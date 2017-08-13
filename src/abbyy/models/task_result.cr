require "http/client"

module Abbyy::Models
  # Holds the results of a task.
  class TaskResult
    # Result downloaded from `task.result_url`.
    getter result : HTTP::Client::BodyType

    # Mime-type of `result`.
    getter result_type : String? = nil

    # Result downloaded from `task.result_url2`.
    getter result2 : HTTP::Client::BodyType

    # Mime-type of `result2`.
    getter result2_type : String? = nil

    # Result downloaded from `task.result_url3`.
    getter result3 : HTTP::Client::BodyType

    # Mime-type of `result3`.
    getter result3_type : String? = nil

    def initialize(@result : HTTP::Client::BodyType = nil,
                   @result2 : HTTP::Client::BodyType = nil,
                   @result3 : HTTP::Client::BodyType = nil)
    end

    def initialize(@result : HTTP::Client::BodyType = nil, @result_type : String? = nil,
                   @result2 : HTTP::Client::BodyType = nil, @result2_type : String? = nil,
                   @result3 : HTTP::Client::BodyType = nil, @result3_type : String? = nil)
    end

    # Save `result` to file.
    def save_result(file_path : String)
      File.write(file_path, @result)
    end

    # Save `result2` to file.
    def save_result2(file_path : String)
      File.write(file_path, @result2)
    end

    # Save `result3` to file.
    def save_result3(file_path : String)
      File.write(file_path, @result3)
    end

    def save_results(file_path : String? = nil,
                     file_path2 : String? = nil,
                     file_path3 : String? = nil)
      save_result(file_path.as(String)) if file_path.is_a?(String)
      save_result2(file_path2.as(String)) if file_path2.is_a?(String)
      save_result3(file_path3.as(String)) if file_path3.is_a?(String)
    end
  end
end
