class OutputWindow
  include TTY::Cursor
  include Screen
  include Styles

  attr_accessor :lines

  def initialize
    self.lines = Array.new(bottom, '')
  end

  def display
    clear
    print_lines
  end

  def clear
    print move_to left, top
    print clear_lines bottom, :down
  end

  def error lines
    lines.each do |line|
      print_line pastel.red line
    end
  end

  def success *lines
    lines.each do |line|
      print_line pastel.green line
    end
  end

  def buffer string
    lines << string
  end

  def print_line string
    lines << string
    display
  end

  def print_lines
    print move_to left, top
    lines.last(bottom).each do |line|
      puts trim line
    end
  end

  # def print_lines strings
  #   self.lines = lines | strings
  #   display
  # end

  def trim string
    string && string[0...right]
  end

  def bottom; rows - 2 end
  def left; 0 end
  def right; columns end
  def top; 0 end
end
