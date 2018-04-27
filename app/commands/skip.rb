class SkipCommand < MultipleTaskCommand
  def print_error_message
    message = "There was an error completing that task"
    interactor.error message
  end

  def skip_and_print_status
    if tasks.all? {|task| task.skipped! }
      print_success_message
    else
      print_error_message
    end
  end

  def run
    skip_and_print_status unless validation_failed?
  end
end
