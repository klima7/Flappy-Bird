require 'gosu'

require_relative '../../framework/window'
require_relative 'recurring_image'

class Trees
  include RecurringImage

  SPEED = 2.0

  @foreground_image = Gosu::Image.new('resources/images/trees_foreground.png')
  @background_image = Gosu::Image.new('resources/images/trees_background.png')

  class << self
    attr_reader :foreground_image, :background_image
  end

  def initialize(map)
    @map = map
  end

  def draw
    draw_foreground
    draw_background
  end

  private

  def draw_foreground
    draw_recurring_image(
      image=self.class.foreground_image,
      map=@map,
      speed=SPEED,
      z=100,
      )
  end

  def draw_background
    draw_recurring_image(
      image=self.class.background_image,
      map=@map,
      speed=SPEED,
      z=-100
    )
  end

end