require 'gosu'

require_relative '../../../framework/window'
require_relative 'recurring_image'

class Landscape
  include RecurringImage

  HILLS_IMAGE = Gosu::Image.new('resources/images/hills.png')
  MOUNTAINS_IMAGE = Gosu::Image.new('resources/images/mountains.png')
  SKY_IMAGE = Gosu::Image.new('resources/images/sky.png')

  HILLS_SPEED = 3.0
  MOUNTAINS_SPEED = 4.0
  Z_ORDER = -1000

  def draw(shift)
    SKY_IMAGE.draw(0, 0, z=Z_ORDER)
    draw_recurring_image(MOUNTAINS_IMAGE, shift, MOUNTAINS_SPEED, z=Z_ORDER)
    draw_recurring_image(HILLS_IMAGE, shift, HILLS_SPEED, z=Z_ORDER)
  end

end
