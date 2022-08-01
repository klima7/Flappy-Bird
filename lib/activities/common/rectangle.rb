class Rectangle

  attr_reader :x, :y, :width, :height

  def initialize(x, y, width, height)
    @x = x
    @y = y
    @width = width
    @height = height
  end

  def left
    x
  end

  def right
    x + width
  end

  def top
    y
  end

  def bottom
    y + height
  end

  def shift(shift_x, shift_y)
    Rectangle.new(x+shift_x, y+shift_y, width, height)
  end

  def collide_point(x, y)
    x >= left && x < right && y >= top && y < bottom
  end

  def collide_rectangle(other_rect)
    collide_point(other_rect.left, other_rect.top) || collide_point(other_rect.right, other_rect.bottom)
  end

end
