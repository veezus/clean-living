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
      'delete <id>   Delete task with the specified ID or IDs',
      'complete <id> Mark task with the specifed ID or IDs as completed',
      '',
      'Additionally, you may abbreviate commands with c, d, n, h, or l.',
    ]
  end

  def run
    message_lines.each {|line| interactor.buffer line }
  end
end
