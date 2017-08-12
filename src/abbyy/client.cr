require "./models/*"

module Abbyy
  include Models

  # Abbyy API-Client
  #
  # The API of ABBYY Cloud OCR SDK uses HTTP POST and HTTP GET methods for sending data to an HTTP server.
  # The parameters of requests are specified in the URL string.
  #
  # Cloud OCR SDK server requires authentication before allowing access to its resources on the Internet.
  # To authenticate on the server, you need a registered Application ID and Application Password.
  #
  # See details in the [Authentication](http://ocrsdk.com/documentation/apireference/authentication) section.
  #
  # **See** [http://ocrsdk.com/documentation/apireference/](http://ocrsdk.com/documentation/apireference/).
  class Client
    # User-Agent
    USER_AGENT = "Abbyy-Client/#{VERSION} (Crystal Client)"

    # Base url of the api.
    property api_url : String = "http://cloud.ocrsdk.com"

    # User's Application ID.
    property application_id : String

    # User's password for authenticaion.
    property password : String

    # Default language setting for recognize text.
    property language : Language? = nil

    def initialize(@application_id, @password, @language = nil)
    end

    # The method loads the image, creates a processing task for the image with
    # the specified parameters, and passes the task for processing.
    #
    # The image file is transmitted in the request body. See the list of
    # [supported input formats](http://ocrsdk.com/documentation/specifications/image-formats/).
    #
    # This method allows you to specify up to three file formats for the result,
    # in which case the [server response](http://ocrsdk.com/documentation/specifications/status-codes/)
    # for the completed task will contain several result URLs.
    #
    # If there is not enough money on your account, the task will be created,
    # but will be suspended with `TaskStatus::NotEnoughCredits` status.
    # You can pass this task for processing using the `process_document` method
    # after you have topped up your account.
    #
    # The task will not be created, if you exceed the limit of uploaded images.
    #
    # For details on task cost please see [billing terms](http://ocrsdk.com/plans-and-pricing/billing-terms/).
    def process_image(request : ProcessImageRequest) : ProcessImageResponse
      api_post :processImage, request, ProcessImageResponse
    end

    # The method adds the image to the existing task or creates a new task for
    # the image. This task is not passed for processing until the
    # `process_document` or `process_fields` method is called for it.
    def submit_image(request : SubmitImageRequest) : SubmitImageResponse
      api_post :submitImage, request, SubmitImageResponse
    end

    def submit_image(@file_path : String, @task_id : String? = nil, @pdf_password : String? = nil) : SubmitImageResponse
      submit_image SubmitImageRequest.new @file_path, @task_id, @pdf_password
    end

    # The method starts the processing task with the specified parameters.
    #
    # This method allows you to process several images using the same settings
    # and obtain recognition result as a multi-page document.
    # You can upload several images to one task using `submit_image` method.
    #
    # It is also possible to specify up to three file formats for the result,
    # in which case the [server response](`ProcessDocumentRequest`)
    # for the completed task will contain several result URLs.
    #
    # Only the task with `TaskStatus::Submitted`, `TaskStatus::Completed` or
    # `TaskStatus::NotEnoughCredits` status can be started using this method.
    #
    # For details on task cost please see [billing terms](http://ocrsdk.com/plans-and-pricing/billing-terms/).
    def process_document(request : ProcessDocumentRequest) : ProcessDocumentResponse
      api_get :processDocument, request, ProcessDocumentResponse
    end

    # The method allows you to recognize a business card on an image. The method
    # loads the image, creates a processing task for the image with the
    # specified parameters, and passes the task for processing.
    #
    # The image file is transmitted in the request body.
    # See the list of [supported input formats](http://ocrsdk.com/documentation/specifications/image-formats/).
    #
    # For details on task cost please see [billing terms](http://ocrsdk.com/plans-and-pricing/billing-terms/).
    def process_business_card(request : ProcessBusinessCardRequest) : ProcessBusinessCardResponse
      api_post :processBusinessCard, request, ProcessBusinessCardResponse
    end

    # The method allows you to extract the value of a text field on an image.
    # The method loads the image, creates a processing task for the image with
    # the specified parameters, and passes the task for processing.
    #
    # The image file is transmitted in the request body.
    # See the list of [supported input](http://ocrsdk.com/documentation/specifications/image-formats/) formats.
    #
    # `Profile::FieldLevelRecognition` profile is used for processing.
    #
    # The result of recognition is returned in XML format.
    #
    # See [How to Recognize Text Fields](http://ocrsdk.com/documentation/quick-start/text-fields/)
    # to know how to tune the parameters.
    #
    # For details on task cost please see [billing terms](http://ocrsdk.com/plans-and-pricing/billing-terms/).
    def process_text_field(request : ProcessTextFieldRequest) : ProcessTextFieldResponse
      api_post :processTextField, request, ProcessTextFieldResponse
    end

    # The method allows you to extract the value of a barcode on an image.
    # The method loads the image, creates a processing task for the image with
    # the specified parameters, and passes the task for processing.
    #
    # The image file is transmitted in the request body.
    # See the list of [supported input](http://ocrsdk.com/documentation/specifications/image-formats/) formats.
    #
    # `Profile::BarcodeRecognition` profile is used for processing.
    #
    # The result of recognition is returned in XML format. Binary data is returned in Base64 encoding.
    #
    # See How to [Recognize Barcodes](http://ocrsdk.com/documentation/quick-start/barcode-sdk/)
    # to know another way of barcode recognition.
    #
    # For details on task cost please see [billing terms](http://ocrsdk.com/plans-and-pricing/billing-terms/).
    def process_barcode_field(request : ProcessBarcodeFieldRequest) : ProcessBarcodeFieldResponse
      api_post :processBarcodeField, request, ProcessBarcodeFieldResponse
    end

    # The method allows you to extract the value of a checkmark on an image.
    # The method loads the image, creates a processing task for the image with
    # the specified parameters, and passes the task for processing.
    #
    # The image file is transmitted in the request body.
    # See the list of [supported input](http://ocrsdk.com/documentation/specifications/image-formats/) formats.
    #
    # The result of recognition is returned in XML format.
    # The values of checkmarks are "checked", "unchecked", or "corrected".
    #
    # For details on task cost please see [billing terms](http://ocrsdk.com/plans-and-pricing/billing-terms/).
    def process_checkmark_field(request : ProcessCheckmarkFieldRequest) : ProcessCheckmarkFieldResponse
      api_post :processCheckmarkField, request, ProcessCheckmarkFieldResponse
    end

    # The method allows you to recognize several fields in a document.
    # The method starts the processing task with the parameters of
    # processing specified in an XML file.
    #
    # The XML file with the parameters of processing is transmitted in the
    # request body. You can use the
    # [XSD schema](http://ocrsdk.com/schema/taskDescription-1.0.xsd) of the XML
    # file to create the file with necessary settings. See also the description
    # of the tags and several examples of XML files with settings in
    # [XML Parameters of Field Recognition](http://ocrsdk.com/documentation/specifications/xml-scheme-field-settings/).
    #
    # Image files can be uploaded to the task using `submit_image` method.
    #
    # Only the task with `TaskStatus::Submitted`, `TaskStatus::Completed` or
    # `TaskStatus::NotEnoughCredits` status can be started using this method.
    #
    # The result of recognition is returned in XML format.
    # Binary data is returned in Base64 encoding.
    #
    # Note that this method is most convenient when you process a large number
    # of fields on one page: in this case the price of recognition of all fields
    # on one page does not exceed the price of recognition of a page of A4 size.
    # See details in [Billing terms](http://ocrsdk.com/plans-and-pricing/billing-terms/).
    def process_fields(request : ProcessFieldsRequest) : ProcessFieldsResponse
      api_post :processFields, request, ProcessFieldsResponse
    end

    # This method finds a machine-readable zone on the image and extracts data from it.
    #
    #  Machine-readable zone (MRZ) is typically found on official travel or
    # identity documents of many countries. It can have 2 lines or 3 lines of
    # machine-readable data. This method allows to process MRZ written in
    # accordance with [ICAO](http://en.wikipedia.org/wiki/ICAO) Document 9303
    # (endorsed by the [International Organization for Standardization](http://en.wikipedia.org/wiki/International_Organization_for_Standardization)
    # and the [International Electrotechnical Commission](http://en.wikipedia.org/wiki/International_Electrotechnical_Commission) as ISO/IEC 7501-1)).
    #
    # The image file is transmitted in the request body. See the list of
    # [supported input formats](http://ocrsdk.com/documentation/specifications/image-formats/).
    #
    # The result of recognition is returned in XML format.
    #
    # For details on task cost please see [billing terms](http://ocrsdk.com/plans-and-pricing/billing-terms/).
    def process_mrz(request : ProcessMRZRequest) : ProcessMRZResponse
      api_post :processMRZ, request, ProcessMRZResponse
    end

    # **Important: the technology fully supports US receipts, other countries are currently supported in beta mode.**
    #
    # The method allows you to recognize the image of a receipt. The method
    # loads the image, creates a processing task for the image with the
    # specified parameters, and passes the task for processing.
    #
    # The image file is transmitted in the request body. See the list of
    # [supported input formats](http://ocrsdk.com/documentation/specifications/image-formats/).
    #
    # The result is returned in XML format. The elements and attributes of the
    # resulting file are described in
    # [Output XML with Receipt Data](http://ocrsdk.com/documentation/specifications/xml-scheme-recognized-receipt/).
    #
    # For details on task cost please see [billing terms](http://ocrsdk.com/plans-and-pricing/billing-terms/).
    #
    # For a step-by-step guide, see
    # [How to Recognize Receipts](http://ocrsdk.com/documentation/quick-start/receipt-recognition/).
    # The best practices can be found at
    # [ABBYY Technology Portal](https://abbyy.technology/en:products:rcsdk:recommendations).
    def process_receipt(request : ProcessReceiptRequest) : ProcessReceiptResponse
      api_post :processReceipt, request, ProcessReceiptResponse
    end

    # The method returns the current status of the task and the URL of the
    # result of processing for completed tasks. The hyperlink has limited
    # lifetime. If you want to download the result after the time has passed,
    # call the `get_task_status` or `list_tasks` method to obtain the new hyperlink.
    #
    # See [here](http://ocrsdk.com/documentation/specifications/task-statuses/)
    # for the description of all statuses a task can have.
    #
    # Please note that the task status is not changed momentarily.
    # Do not call this method more frequently than once in 2 or 3 seconds.
    def get_task_status(request : GetTaskStatusRequest) : GetTaskStatusResponse
      api_get :getTaskStatus, request, GetTaskStatusResponse
    end

    def get_task_status(task_id : String) : GetTaskStatusResponse
      get_task_status GetTaskStatusRequest.new task_id
    end

    # The method deletes the task and the images associated with this task from
    # the ABBYY Cloud OCR SDK storage. Only the tasks that have the status other
    # than `TaskStatus::InProgress` or `TaskStatus::Deleted` can be deleted.
    #
    # If you try to delete the task that has already been deleted,
    # the successful response is returned.
    #
    # If you submit the same image to different tasks, to delete the image from
    # the Cloud OCR SDK storage, you will need to call the `delete_task` method
    # for each task, which contains the image.
    def delete_task(request : DeleteTaskRequest) : DeleteTaskResponse
      api_get :deleteTask, request, DeleteTaskResponse
    end

    def delete_task(task_id : String) : DeleteTaskResponse
      delete_task DeleteTaskRequest.new task_id
    end

    # The method returns the list of tasks created by your application.
    # By default, the `TaskStatus::Deleted` tasks are included,
    # but you can filter them out.
    #
    # The tasks are ordered by the date of the last action with the task.
    # This method can list up to 1000 tasks. If you process a large number of
    # tasks, call this method for shorter time periods.
    def list_tasks(request : ListTasksRequest?) : ListTasksResponse
      api_get :listTasks, request, ListTasksResponse
    end

    def list_tasks(from_date : Time? = nil, to_date : Time? = nil, exclude_deleted : Bool? = nil) : ListTasksResponse
      list_tasks ListTasksRequest.new from_date, to_date, exclude_deleted
    end

    # The method returns the list of finished tasks. A task is finished if it
    # has one of the following statuses: `TaskStatus::Completed`,
    # `TaskStatus::ProcessingFailed`, `TaskStatus::NotEnoughCredits`.
    #
    # The tasks are ordered by the time of the end of processing. No more than
    # 100 tasks can be returned at one method call. To obtain more tasks, delete
    # some finished tasks using the `delete_task` method and then call the
    # `list_finished_tasks` method again.
    #
    # The method may be useful if you work with a large number of tasks
    # simultaneously. But there is no sense in calling this method if your
    # application does not have any incomplete tasks sent for the processing.
    #
    # Please note that the task status is not changed momentarily.
    # Do not call this method more frequently than once in 2 or 3 seconds.
    def list_finished_tasks
      api_get :listFinishedTasks, nil, ListTasksResponse
    end

    # This method allows you to receive information about the application type,
    # its current balance and expiration date.
    #
    # The application is identified by its authentication information.
    #
    # By default the call to this method is disabled for all applications.
    # To enable getting the application information using this method:
    # - go to [http://cloud.ocrsdk.com/](http://cloud.ocrsdk.com/) and log in
    # - click **Settings** under your application's name
    # - on the next screen, click **enable**
    def get_application_info : GetApplicationInfoResponse
      api_get :getApplicationInfo, nil, GetApplicationInfoResponse
    end

    private def api_get(method, request : BaseRequest?, result_type : ResultT.class) forall ResultT
      uri = build_uri method, request
      HTTP::Client.get(uri, headers: headers) do |response|
        result_type.new response
      end
    end

    private def api_post(method, request : BaseRequest?, result_type : ResultT.class) forall ResultT
      uri = build_uri method, request
      HTTP::Client.post(uri, body: request ? request.body : nil, headers: headers) do |response|
        result_type.new response
      end
    end

    private def build_uri(method, request : BaseRequest?)
      uri = URI.parse "#{api_url}/#{method}"
      uri.user = @application_id
      uri.password = @password

      params = request ? request.params : {} of String => String
      if !params["language"]? && @language
        params["language"] = @language.to_s
      end
      uri.query = HTTP::Params.encode(params) unless params.empty?
      uri
    end

    private def headers
      HTTP::Headers{"User-Agent" => USER_AGENT}
    end
  end
end
