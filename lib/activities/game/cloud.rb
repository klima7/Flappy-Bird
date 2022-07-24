require 'gosu'

class Cloud
  WIDTH = 250
  HEIGHT = 125
  SPEED = 200

  attr_reader :pos_x, :pos_y

  @images = Gosu::Image.load_tiles('resources/images/clouds.png', WIDTH, HEIGHT)

  class << self
    attr_reader :images
  end

  def initialize(pos_x, pos_y)
    @image = self.class.images.sample
    @pos_x = pos_x
    @pos_y = pos_y
  end

  def draw
    @image.draw(@pos_x, @pos_y)
  end

  def update(elapsed_time)
    @pos_x -= SPEED * elapsed_time
  end
end
