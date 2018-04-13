class NewCommand < BaseCommand
  attr_accessor :task

  def initialize interactor
    super
    self.task = Task.new
  end

  def prompt_for_due_date
    task.chronic_due = interactor.ask "When should it be done by?"
    if task.chronic_due.present? && task.due_at.blank?
      prompt_for_due_date
    end
  end

  def prompt_for_name
    task.name = interactor.ask "What needs to be done?"
  end

  def print_error_message
    message = \
      "There was an error saving that task:\n#{ErrorFormatter.console(task.errors)}"
    interactor.error message.split "\n"
  end

  def print_success_message
    interactor.success "Successfully created task."
  end

  def save_and_print_status
    if task.save
      print_success_message
    else
      print_error_message
    end
  end

  def run
    prompt_for_name
    prompt_for_due_date
    save_and_print_status
  end
end
