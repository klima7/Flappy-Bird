require 'gosu'

require_relative '../../utils'
require_relative '../../framework/window'
require_relative 'clouds'

class Background
  LAYER1_SPEED = 2.0
  LAYER2_SPEED = 3.0
  LAYER3_SPEED = 4.0

  @layer1_image = Gosu::Image.new('resources/images/layer1.png')
  @layer2_image = Gosu::Image.new('resources/images/layer2.png')
  @layer3_image = Gosu::Image.new('resources/images/layer3.png')
  @layer4_image = Gosu::Image.new('resources/images/layer4.png')

  class << self
    attr_reader :layer1_image, :layer2_image, :layer3_image, :layer4_image
  end

  def initialize(map)
    @map = map
    @clouds = Clouds.new
  end

  def draw
    fill_screen(Gosu::Color::WHITE)
    self.class.layer4_image.draw(0, 0)
    draw_layer(self.class.layer3_image, LAYER3_SPEED)
    draw_layer(self.class.layer2_image, LAYER2_SPEED)
    draw_layer(self.class.layer1_image, LAYER1_SPEED)
    @clouds.draw
  end

  def update(elapsed_time)
    @clouds.update(elapsed_time)
  end

  def draw_layer(image, speed)
    x1 = (-@map.shift / speed).to_i % Window::WIDTH
    x2 = x1 - Window::WIDTH
    image.draw(x1, 0)
    image.draw(x2, 0)
  end
end
