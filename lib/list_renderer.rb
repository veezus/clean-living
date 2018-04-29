module ListRenderer
  def headers
    [pastel.green('✔'), 'Due', 'ID', 'Task']
  end

  def format_completed task
    case
    when task.completed?
      pastel.green '✔'
    when task.skipped?
      pastel.yellow '◎'
    else
      ''
    end
  end

  def format_due_at task
    return "n/a" if task.due_at.nil?

    case
    when task.completed?
      pastel.green format_date_string task.due_at
    when task.skipped?
      pastel.yellow format_date_string task.due_at
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
      [format_completed(task), format_due_at(task), task.id, task.name]
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
