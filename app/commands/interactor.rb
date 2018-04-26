class InteractorCommand
  attr_accessor :output_window, :prompt, :status_bar
  attr_accessor :command, :arguments

  def initialize
    self.output_window = OutputWindow.new
    self.prompt = Prompt.new
    self.status_bar = StatusBar.new
  end

  def ask string
    say string
    status_bar.display
    prompt.query
  end

  def refresh
    TTY::Cursor.clear_screen
    output_window.display
    status_bar.display
  end

  def parse! query
    return unless query.present?

    parts = query.split(' ')
    self.command = parts.shift
    self.arguments = parts
  end

  def run
    loop do
      refresh
      parse! prompt.query

      case command
      when 'l', 'list'
        clear_buffer
        if %w(c completed).include? arguments.first
          CompletedListCommand.new(self).run
        elsif %w(i incomplete).include? arguments.first
          IncompleteListCommand.new(self).run
        elsif %w(t today).include? arguments.first
          TodaysList.new(self).run
        else
          ListCommand.new(self).run
        end
      when 'n', 'new'
        NewCommand.new(self).run
      when 'c', 'complete'
        CompleteCommand.new(self).run
      when 'd', 'delete', 'r', 'remove'
        DeleteCommand.new(self).run
      when '?', 'h', 'help'
        HelpCommand.new(self).run
      when 'exit', 'quit', 'q'
        say 'Goodbye!' and break
      else
        say "Unknown command: #{command}"
      end
    end
  end

  def buffer(message) output_window.buffer message end
  def clear_buffer; output_window.clear_buffer end
  def error(message) output_window.error message end
  def say(message) output_window.print_line message end
  def success(message) output_window.success message end
end
