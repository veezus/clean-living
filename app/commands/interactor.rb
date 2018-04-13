class InteractorCommand
  attr_accessor :output_window, :prompt, :status_bar

  def initialize
    self.output_window = OutputWindow.new
    self.prompt = Prompt.new
    self.status_bar = StatusBar.new
  end

  def ask string
    output_window.print_line string
    status_bar.display
    prompt.query
  end

  def refresh
    output_window.display
    status_bar.display
  end

  def run
    loop do
      TTY::Cursor.clear_screen
      output_window.display
      status_bar.display
      query = prompt.query
      case query
      when 'list'
        ListCommand.new(self).run
      when 'new'
        NewCommand.new(self).run
      else
        output_window.print_line "Unknown command: #{query}"
      end
    end
  end

  def buffer(message) output_window.buffer message end
  def error(message) output_window.error message end
  def say(message) output_window.print_line message end
  def success(message) output_window.success message end
end
