class StatusBar
  include TTY::Cursor
  include Screen
  include Styles

  def display
    print move_to 0, row
    print clear_line
    print pastel.black.on_bright_white status_text
  end

  def status_text
    "Total number of tasks: #{Task.count} ".ljust columns
  end

  def row; rows - 2 end
end
