class String
  # Regulal expression for 'taskId'.
  TASK_ID_FORMAT = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/

  # Returns **true** if the string is a valid 'taskId'; **false** otherwise.
  def is_task_id? : Bool
    self.match(TASK_ID_FORMAT).is_a? Regex::MatchData
  end
end
