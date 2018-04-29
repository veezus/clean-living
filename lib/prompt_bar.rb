class PromptBar
  include TTY::Cursor
  include Screen

  attr_accessor :commands, :current_key, :current_command

  def initialize
    self.commands = []
    self.current_key = ''
    self.current_command = ''
  end

  def refresh
    print move_to 0, row
    print clear_line
    print prompt + current_command
  end

  def query
    refresh

    loop do
      self.current_key = tty.read_keypress
      case current_key
      when "\r"
        commands.push current_command
        self.current_command = self.current_key = ''
        return commands.last
      when "\u007F" # Backspace
        current_command.chop!
        refresh
      when ?\C-p
        self.current_command = commands.last if commands.any?
        refresh
      when ?\C-d
        return 'q'
      else
        self.current_command += current_key
        print current_key
      end
    end
  end

  def print_current_key_info
    print "#{current_key.inspect} [#{current_key.ord}] (hex: #{current_key.ord.to_s(16)})"
  end
  private :print_current_key_info

  def prompt; "? " end
  def tty; TTY::Reader.new interrupt: :noop end
  def row; rows - 1 end
end
