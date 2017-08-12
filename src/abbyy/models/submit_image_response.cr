require "./task_response"

module Abbyy::Models
  # Response object for [/submitImage](http://ocrsdk.com/documentation/apireference/submitImage/) API-method.
  #
  # ###Status codes
  #
  # The following status codes can be returned when this method is called:
  # - **200** Successful method call.
  # - **450** Incorrect parameters have been passed. One of the following errors occurred:
  #   - Image file has not been specified.
  #   - The task with the specified identifier has been deleted.
  #   - There is no task with the specified identifier.
  #   - Incorrect password for accessing password-protected image file has been specified.
  #   - Exceeded quota to add images. This error is returned if the number of
  # images you have uploaded exceeds the number of images you can process with
  # the credits available on your account plus some threshold. You can resolve
  # this issue by topping up your account or by removing the tasks which have
  # been submitted but have not been processed.
  # - **550** An internal program error occurred while processing the image.
  # - **551** An error occurred on the server side:
  #   - The format of the image file passed for processing is not supported.
  #   - The PDF file passed for processing has restrictions on creating raster images.
  class SubmitImageResponse < TaskResponse
  end
end
