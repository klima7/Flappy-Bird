require 'gosu'

require_relative '../../utils'
require_relative '../../framework/window'
require_relative 'clouds'

class Background
  LAYER1_SPEED = 2.0

  @layer1_image = Gosu::Image.new('resources/images/layer1.png')

  class << self
    attr_reader :layer1_image
  end

  def initialize(map)
    @map = map
    @clouds = Clouds.new
  end

  def draw
    fill_screen(Gosu::Color::WHITE)
    draw_layer(self.class.layer1_image, LAYER1_SPEED)
    @clouds.draw
  end

  def update(elapsed_time)
    @clouds.update(elapsed_time)
  end

  def draw_layer(image, speed)
    x1 = (-@map.shift / speed) % Window::WIDTH
    x2 = x1 - Window::WIDTH
    image.draw(x1, 0)
    image.draw(x2, 0)
  end
end
