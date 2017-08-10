require "./file_body"
require "./task_id_request"

module Abbyy::Models
  # Request object for `/submitImage` API-method.
  class SubmitImageRequest < TaskIdRequest
    include FileBody

    # Contains a password for accessing password-protected images in PDF format.
    # [Not required]
    property pdf_password : String? = nil

    def params : Hash(String, String)
      hash = super.params
      hash["pdfPassword"] = @pdf_password if @pdf_password
      hash
    end
  end
end
