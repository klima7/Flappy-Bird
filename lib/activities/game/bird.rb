require 'gosu'

class Bird
  def initialize(map)
    @map = map
    @x, @y = 0, 0
    @image = Gosu::Image.new('../../../resources/images/bird.bmp')
  end

  def draw
  end

  def update(elapsed_time)
  end
end
