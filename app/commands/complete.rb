class CompleteCommand < BaseCommand
  attr_accessor :id, :task

  def initialize interactor
    super
    self.id = interactor.arguments.first
    self.task = Task.find_by_id id
  end

  def please_provide_an_id
    message = "Please provide a single task id that you'd like to complete"
    interactor.error message
  end

  def could_not_find_task
    message = "Couldn't find a task with id #{id}"
    interactor.error message
  end

  def print_error_message
    message = "There was an error completing that task"
    interactor.error message
  end

  def print_success_message
    interactor.success "Successfully completed task."
  end

  def complete_and_print_status
    if task.completed!
      print_success_message
    else
      print_error_message
    end
  end

  def run
    return please_provide_an_id unless id.present?
    return could_not_find_task unless task.present?
    complete_and_print_status
  end
end
