class InteractorCommand
  attr_accessor :output_window, :prompt, :status_bar

  def initialize
    self.output_window = OutputWindow.new
    self.prompt = Prompt.new
    self.status_bar = StatusBar.new
  end

  def run
    loop do
      TTY::Cursor.clear_screen
      output_window.display
      status_bar.display
      query = prompt.query
      case query
      when 'new'
        output_window.print_line "New command"
      else
        output_window.print_line "Unknown command: #{query}"
      end
    end
  end
end
