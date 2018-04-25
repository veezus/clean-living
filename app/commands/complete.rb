class CompleteCommand < MultipleTaskCommand
  def print_error_message
    message = "There was an error completing that task"
    interactor.error message
  end

  def complete_and_print_status
    if tasks.all? {|task| task.completed! }
      print_success_message
    else
      print_error_message
    end
  end

  def run
    complete_and_print_status unless validation_failed?
  end
end
