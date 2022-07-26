require 'gosu'

require_relative '../../framework/window'
require_relative 'recurring_image'

class Landscape
  include RecurringImage

  HILLS_SPEED = 3.0
  MOUNTAINS_SPEED = 4.0
  Z_ORDER = -1000

  @hills_image = Gosu::Image.new('resources/images/hills.png')
  @mountains_image = Gosu::Image.new('resources/images/mountains.png')
  @sky_image = Gosu::Image.new('resources/images/sky.png')

  class << self
    attr_reader :hills_image, :mountains_image, :sky_image
  end

  def initialize(map)
    @map = map
  end

  def draw
    self.class.sky_image.draw(0, 0, z=Z_ORDER)
    draw_recurring_image(self.class.mountains_image, @map, MOUNTAINS_SPEED, z=Z_ORDER)

    draw_recurring_image(self.class.hills_image, @map, HILLS_SPEED, z=Z_ORDER)
  end
end
