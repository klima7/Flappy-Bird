require 'gosu'

require_relative '../../framework/window'
require_relative 'recurring_image'

class Trees
  include RecurringImage

  SPEED = 2.0
  ANGLE_SPEED = 1

  SHIFT_X = 8
  SHIFT_Y = 8

  @foreground_image = Gosu::Image.new('resources/images/trees_foreground.png')
  @background_image = Gosu::Image.new('resources/images/trees_background.png')

  class << self
    attr_reader :foreground_image, :background_image
  end

  def initialize(map)
    @map = map
    @phase = 0
  end

  def draw
    shift_x = Math.cos(@phase) * SHIFT_X
    shift_y = Math.sin(@phase) * SHIFT_Y

    draw_recurring_image(
      self.class.background_image,
      @map,
      SPEED,
      -100,
      shift_x,
      SHIFT_Y-shift_y
    )

    draw_recurring_image(
      self.class.foreground_image,
      @map,
      SPEED,
      100,
      -shift_x,
      SHIFT_Y+shift_y
    )
  end

  def update(elapsed_time)
    @phase = (@phase + ANGLE_SPEED * elapsed_time) % (2*Math::PI)
  end
end