class HelpCommand < BaseCommand
  def message_lines
    [
      'Available options:',
      '==================',
      'list          List all tasks',
      'list i        List incomplete tasks',
      'list c        List completed tasks',
      'new           Create a new task',
      'new <name>    Create a new task with `name`',
      'delete <id>   Delete task with the specified ID',
      'complete <id> Mark task with the specifed ID as completed',
    ]
  end

  def run
    message_lines.each {|line| interactor.buffer line }
  end
end
