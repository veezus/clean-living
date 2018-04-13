class InteractorCommand
  include Curses

  def run
    init_screen

    begin
      status_bar = StatusBar.new
      prompt = Prompt.new

      status_bar.display
      loop do
        prompt.query
        case prompt.query
        when 'new'
          ::NewCommand.new.run
        end
      end
    ensure
      close_screen
    end
  end
end
