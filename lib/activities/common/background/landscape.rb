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

  def draw(shift)
    SKY_IMAGE.draw(0, 0, z=-3000)
    draw_recurring_image(MOUNTAINS_IMAGE, shift, MOUNTAINS_SPEED, z=-2000)
    draw_recurring_image(HILLS_IMAGE, shift, HILLS_SPEED, z=-1000)
  end

end
