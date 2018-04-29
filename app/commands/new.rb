class NewCommand < BaseCommand
  attr_accessor :task

  def initialize interactor
    super
    parts = interactor.arguments.join(' ').split ','
    name = parts.first
    due_at = parts.second
    tags = parts.third.split(' ')
    self.task = Task.new name: name, chronic_due: due_at, tags: tags
  end

  def prompt_for_due_date
    return unless task.chronic_due.blank?

    task.chronic_due = interactor.ask "When should that be done by?"
    if task.chronic_due.present? && task.due_at.blank?
      prompt_for_due_date
    end
  end

  def prompt_for_name
    return unless task.name.blank?

    task.name = interactor.ask "What's the todo?"
  end

  def echo_name
    interactor.say "Creating task #{task.name}"
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
    echo_name
    prompt_for_due_date
    save_and_print_status
  end
end
