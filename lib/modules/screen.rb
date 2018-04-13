module Screen
  def columns
    TTY::Screen.width
  end

  def screen
    TTY::Screen
  end

  def rows
    TTY::Screen.height
  end
end
