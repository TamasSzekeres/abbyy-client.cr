module Abbyy::Models
  abstract class BaseModel
    getter errors : Hash(Symbol, String) = Hash(Symbol, String).new

    def validate!
      !has_errors?
    end

    def has_errors?
      !@errors.empty?
    end

    def add_error(field, message)
      @errors[field] = message
    end
  end
end
