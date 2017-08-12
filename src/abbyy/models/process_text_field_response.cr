require "./task_response"

module Abbyy::Models
  # Response object for [/processTextField](http://ocrsdk.com/documentation/apireference/processTextField/) API-method.
  #
  # ###Status codes
  #
  # The following status codes can be returned when this method is called:
  # - **200** Successful method call.
  # - **450** Incorrect parameters have been passed. One of the following errors occurred:
  #   - Image file has not been specified.
  #   - Incorrect region of the field has been specified.
  #   - Incorrect recognition language has been specified.
  #   - Incorrect regular expression has been specified.
  #   - Incorrect text type has been specified.
  #   - Handprinted text type is not supported for the specified languages.
  #   - Incorrect field marking type has been specified.
  #   - The number of cells in the field is not a positive number.
  #   - Incorrect writing style has been specified.
  #   - Task description length exceeds 255 characters.
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
  #
  # ###Output file format
  #
  # The output XML file has the following format:
  # ```
  # <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
  # <document xmlns="@link" xmlns:xsi="@link" xsi:schemaLocation="@link" version="1.0">
  #     <field left=”0” top=”0” right=”199” bottom=”100” type=”text”>
  #         <value encoding=”UTF-16”>Data Capture Sample Text Data</value>
  #         <line left=”0” top=”0” right=”199” bottom=”100”>
  #             <char left=”0” top=”0” right=”199” bottom=”100” confidence=”98”>
  #             D
  #             </char>
  #             …
  #         </line>
  #         …
  #     </field>
  # </document>
  # ```
  class ProcessTextFieldResponse < TaskResponse
  end
end
