require "xml"

module Abbyy::Models
  # Task.
  #
  # **See** [status-codes](http://ocrsdk.com/documentation/specifications/status-codes/)
  class Task < BaseModel
    TIME_FORMAT = "%Y-%m-%dT%H:%M:%SZ"

    # Specifies the identifier of the task.
    property id : String? = nil
    property registration_time : Time? = nil
    property status_change_time : Time? = nil
    property status : TaskStatus? = nil

    # Description of the error occurred during processing.
    # This attribute is available for the tasks with `ProcessingFailed` status only.
    property error : String? = nil

    # Specifies the number of files in the task.
    property files_count : Int32? = nil

    # Specifies the cost of processing: it contains the estimated cost before task
    # processing, and the actual cost, after the task has been completed.
    # The measurement unit is the price of processing of one field.
    property credits : Int32? = nil

    # Estimated time until the task is completed (in seconds).
    # This attribute is available for the tasks with `Queued` or `InProgress` status.
    property estimated_processing_time : Int32? = nil

    # This attribute is only available for completed tasks. It provides the URL
    # of the result of processing. The hyperlink has limited lifetime. If you
    # want to download the result after that time has passed, use the
    # [getTaskStatus](http://ocrsdk.com/documentation/apireference/getTaskStatus/)
    # or [listTasks](http://ocrsdk.com/documentation/apireference/listTasks/) method to obtain the new hyperlink.
    property result_url : String? = nil

    # This attribute is only available for completed tasks which were processed
    # with multiple export formats. It provides the URL of the result saved in
    # the second specified format. Otherwise, it has the same properties as the resultUrl attribute.
    property result_url2 : String? = nil

    # This attribute is only available for completed tasks which were processed
    # with three export formats. It provides the URL of the result saved in the
    # third specified format. Otherwise, it has the same properties as the resultUrl attribute.
    property result_url3 : String? = nil
    property description : String? = nil

    def initialize(xml : XML::Node)
      xml.attributes.each do |attr|
        case attr.name
        when "id" then @id = attr.content
        when "registrationTime" then @registration_time = Time.parse attr.content, TIME_FORMAT
        when "statusChangeTime" then @status_change_time = Time.parse attr.content, TIME_FORMAT
        when "status" then @status = TaskStatus.parse? attr.content
        when "error" then @error = attr.content if attr.content.is_a?(String)
        when "filesCount" then @files_count = attr.content.to_i if attr.content.is_a? String
        when "credits" then @credits = attr.content.to_i if attr.content.is_a? String
        when "estimatedProcessingTime" then @estimated_processing_time = attr.content.to_i if attr.content.is_a? String
        when "resultUrl" then @result_url = attr.content if attr.content.is_a? String
        when "resultUrl2" then @result_url2 = attr.content if attr.content.is_a? String
        when "resultUrl3" then @result_url3 = attr.content if attr.content.is_a? String
        when "description" then @description = attr.content if attr.content.is_a? String
        end
      end
    end
  end
end
