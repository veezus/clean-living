require 'curses'

class Prompt
  include Curses

  def display
    setpos line, 0
    addstr prompt.ljust cols
    setpos line, col
    refresh
  end

  def query
    display
    response = getstr
    display
    return response
  end

  def prompt; "Prompt: "; end
  def line; lines - 1; end
  def col; prompt.length; end
end
