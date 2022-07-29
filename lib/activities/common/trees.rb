require 'gosu'

require_relative '../../framework/window'
require_relative 'recurring_image'

class Trees
  include RecurringImage

  FOREGROUND_IMAGE = Gosu::Image.new('resources/images/trees_foreground.png')
  BACKGROUND_IMAGE = Gosu::Image.new('resources/images/trees_background.png')

  LINEAR_SPEED = 2.0
  ANGLE_SPEED = 1

  SHIFT_X = 8
  SHIFT_Y = 8

  def initialize
    @phase = 0
  end

  def draw(shift)
    shift_x = Math.cos(@phase) * SHIFT_X
    shift_y = Math.sin(@phase) * SHIFT_Y

    draw_recurring_image(BACKGROUND_IMAGE, shift, LINEAR_SPEED, -100, shift_x, SHIFT_Y-shift_y)
    draw_recurring_image(FOREGROUND_IMAGE, shift, LINEAR_SPEED, 100, -shift_x, SHIFT_Y+shift_y)
  end

  def update(elapsed_time)
    @phase = (@phase + ANGLE_SPEED * elapsed_time) % (2*Math::PI)
  end

end