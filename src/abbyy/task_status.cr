module Abbyy
  enum TaskStatus
    # The task has been registered in the system, the task has not been passed for processing yet.
    Submitted

    # The task has been placed to the processing queue, it is waiting to be processed.
    Queued

    # The task is being processed.
    InProgress

    # The task has been processed successfully. For a task with this status,
    # the URL for downloading the result of processing is available in the response.
    Completed

    # The task has not been processed because an error occurred. You can find the description of the error in the XML response.
    ProcessingFailed

    # The task has been deleted. This status can be returned only for the deleteTask method.
    Deleted

    # You do not have enough money on your account to process the task.
    NotEnoughCredits
  end
end
