require "./file_body"
require "./task_id_request"

module Abbyy::Models
  # Request object for `/processFields` API-method.
  #
  # **See** [http://ocrsdk.com/documentation/apireference/processFields/](http://ocrsdk.com/documentation/apireference/processFields/).
  class ProcessFieldsRequest < TaskIdRequest
    include FileBody

    property description : String? = nil
    property write_recognition_variants : Bool? = nil

    def params : Hash(String, String)
      hash = super.params
      hash["writeRecognitionVariants"] = @write_recognition_variants.to_s if @write_recognition_variants
      hash["description"] = @description.to_s if @description
      hash
    end
  end
end
