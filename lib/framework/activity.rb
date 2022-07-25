class Activity

  attr_accessor :window

  def update
  end

  def draw
  end

  def button_down(id)
  end

  def button_up(id)
  end

  def close
    window.close!
  end

end
