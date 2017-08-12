require "./task_response"

module Abbyy::Models
  # Response object for [/processImage](http://ocrsdk.com/documentation/apireference/processImage/) API-method.
  #
  # ###Status codes
  # General status codes and response format of the method are described in
  # [HTTP Status Codes and Response Formats](http://ocrsdk.com/documentation/specifications/status-codes/).
  #
  # The following status codes can be returned when this method is called:
  # - **200** Successful method call.
  # - **450** Incorrect parameters have been passed. One of the following errors occurred:
  #   - Incorrect recognition language has been specified.
  #   - Incorrect processing profile has been specified.
  #   - Incorrect export format has been specified.
  #   - Image file has not been specified.
  #   - Task description length exceeds 255 characters.
  #   - Incorrect password for accessing password-protected image file has been specified.
  #   - Exceeded quota to add images. This error is returned if the number of images
  # you have uploaded exceeds the number of images you can process with the
  # credits available on your account plus some threshold. You can resolve this
  # issue by topping up your account or by removing the tasks which have been submitted but have not been processed.
  # - **550** An internal program error occurred while processing the image.
  # - **551** An error occurred on the server side:
  #   - The format of the image file passed for processing is not supported.
  #   - The PDF file passed for processing has restrictions on creating raster images.
  class ProcessImageResponse < TaskResponse
  end
end
