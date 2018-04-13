class NewCommand
  attr_accessor :task
  attr_accessor :name

  def initialize args=[], options=Commander::Command::Options.new
    self.task = Task.new name: args.join(' ')
  end

  def prompt_for_due_date
    return unless task.valid?
    task.chronic_due = ask "When should it be done by?"
    if task.chronic_due.present? && task.due_at.blank?
      prompt_for_due_date
    end
  end

  def prompt_for_name
    return unless name.blank?
    task.name = ask "What needs to be done?"
  end

  def print_error_messages
    HighLine.say HighLine.color \
      "There was an error saving that task:\n#{ErrorFormatter.console(task.errors)}", :red
  end

  def print_success_message
    say %q(<%= color "Successfully created task.", :green %>)
  end

  def save_and_print_status
    if task.save
      print_success_message
    else
      print_error_messages
    end
  end

  def run
    prompt_for_name
    prompt_for_due_date
    save_and_print_status
  end
end
