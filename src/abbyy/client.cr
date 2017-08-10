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
  # See details in the [http://ocrsdk.com/documentation/apireference/authentication](http://ocrsdk.com/documentation/apireference/authentication) section.
  #
  # **See** [http://ocrsdk.com/documentation/apireference/](http://ocrsdk.com/documentation/apireference/).
  class Client
    # User-Agent
    USER_AGENT = "Abbyy-Client/1.0 (Crystal Client)"

    # Base url of the api.
    property api_url : String = "http://cloud.ocrsdk.com"

    # Application ID.
    property application_id : String

    # User's password for authenticaion.
    property password : String

    # Default language setting for recognize text.
    property language : Language? = nil

    def initialize(@application_id, @password, @language = nil)
    end

    def process_image(request : ProcessImageRequest) : ProcessImageResponse
      api_post :processImage, request, ProcessImageResponse
    end

    def submit_image(request : SubmitImageRequest) : SubmitImageResponse
      api_post :submitImage, request, SubmitImageResponse
    end

    def process_document(request : ProcessDocumentRequest) : ProcessDocumentResponse
      api_get :processDocument, request, ProcessDocumentResponse
    end

    def process_business_card(request : ProcessBusinessCardRequest) : ProcessBusinessCardResponse
      api_post :processBusinessCard, request, ProcessBusinessCardResponse
    end

    def process_text_field(request : ProcessTextFieldRequest) : ProcessTextFieldResponse
      api_post :processTextField, request, ProcessTextFieldResponse
    end

    def process_barcode_field(request : ProcessBarcodeFieldRequest) : ProcessBarcodeFieldResponse
      api_post :processBarcodeField, request, ProcessBarcodeFieldResponse
    end

    def process_checkmark_field(request : ProcessCheckmarkFieldRequest) : ProcessCheckmarkFieldResponse
      api_post :processCheckmarkField, request, ProcessCheckmarkFieldResponse
    end

    def process_fields(request : ProcessFieldsRequest) : ProcessFieldsResponse
      api_post :processFields, request, ProcessFieldsResponse
    end

    def process_mrz(request : ProcessMRZRequest) : ProcessMRZResponse
      api_post :processMRZ, request, ProcessMRZResponse
    end

    def process_receipt(request : ProcessReceiptRequest) : ProcessReceiptResponse
      api_post :processReceipt, request, ProcessReceiptResponse
    end

    def get_task_status(request : GetTaskStatusRequest) : GetTaskStatusResponse
      api_get :getTaskStatus, request, GetTaskStatusResponse
    end

    def get_task_status(task_id : String) : GetTaskStatusResponse
      get_task_status GetTaskStatusRequest.new task_id
    end

    def delete_task(request : DeleteTaskRequest) : DeleteTaskResponse
      api_get :deleteTask, request, DeleteTaskResponse
    end

    def delete_task(task_id : String) : DeleteTaskResponse
      delete_task DeleteTaskRequest.new task_id
    end

    # The method returns the list of tasks created by your application.
    # By default, the [Deleted](http://ocrsdk.com/documentation/specifications/task-statuses/)
    # tasks are included, but you can filter them out.
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

    def list_finished_tasks
      api_get :listFinishedTasks, nil, ListTasksResponse
    end

    # This method allows you to receive information about the application type, its current balance and expiration date.
    def get_application_info : GetApplicationInfoResponse
      api_get :getApplicationInfo, nil, GetApplicationInfoResponse
    end

    private def api_get(method, request : BaseRequest?, result_type : ResultT.class) forall ResultT
      uri = build_uri method, request
      HTTP::Client.get(uri) do |response|
        result_type.new response
      end
    end

    private def api_post(method, request : BaseRequest?, result_type : ResultT.class) forall ResultT
      uri = build_uri method, request
      HTTP::Client.post(uri, body: request ? request.body : nil) do |response|
        result_type.new response
      end
    end

    private def build_uri(method, request : BaseRequest?)
      uri = URI.parse "#{api_url}/#{method}"
      uri.user = @application_id
      uri.password = @password
      uri.query = HTTP::Params.encode(request.params) if request
      uri
    end
  end
end
