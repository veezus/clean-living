require 'curses'

class StatusBar
  include Curses

  def display
    setpos lines - 2, 0
    addstr "Total tasks: #{Task.count}"
    refresh
  end
end
