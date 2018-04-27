class HelpCommand < BaseCommand
  def message_lines
    [
      'Available options:',
      '==================',
      'help               This help document',
      '                   Alias: h, ?',
      'list               List all tasks',
      'list i             List all incomplete tasks',
      'list c             List all completed tasks',
      'list t             List tasks due today',
      '                   Alias: l',
      'new                Create a new task',
      'new <name>         Create a new task with specified name',
      'new <name>, <due>  Create a new task with specified name and due date',
      '                   Alias: n',
      'delete <id>        Delete task with the specified ID or IDs',
      '                   Alias: d, r, rm, remove',
      'complete <id>      Mark task with the specifed ID or IDs as completed',
      '                   Alias: c',
      'skip <id>          Mark task with the specifed ID or IDs as skipped',
      '                   Alias: s',
    ]
  end

  def run
    message_lines.each {|line| interactor.buffer line }
  end
end
