module ListRenderer
  def headers
    ['ID', pastel.green('✔'), 'Due', 'Task']
  end

  def messages
    %i(id completed? due_at name)
  end

  def format_completed task
    task.completed? ? pastel.green('✔') : ' '
  end

  def format_due_at task
    return "n/a" if task.due_at.nil?

    case
    when task.completed?
      pastel.green format_date_string task.due_at
    when !task.due_at.future?
      pastel.red format_date_string task.due_at
    when task.due_at.today?
      pastel.blue format_date_string task.due_at
    else
      format_date_string task.due_at
    end
  end

  def format_date_string due_at
    due_at.strftime "%a %b %d, %H:%M"
  end

  def table
    return @table if defined? @table
    rows = tasks.map do |task|
      [task.id, format_completed(task), format_due_at(task), task.name]
    end
    @table ||= TTY::Table.new headers, rows
  end

  def render
    table.render do |renderer|
      renderer.border do
        mid '-'
        mid_mid '  '
        center '  '
      end
    end
  end
end
