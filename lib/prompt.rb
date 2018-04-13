class Prompt
  include TTY::Cursor
  include Screen

  def query
    print move_to 0, row
    print clear_line
    tty.ask prompt
  end

  def prompt; "? " end
  def tty; TTY::Prompt.new end
  def row; rows - 1 end
end
