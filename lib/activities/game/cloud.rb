require 'gosu'

class Cloud
  WIDTH = 250
  HEIGHT = 125

  LINEAR_SPEED = 200
  ANGLE_SPEED = 1
  AMPLITUDE = 50
  TILT_ANGLE = 10

  attr_reader :pos_x, :pos_y

  @images = Gosu::Image.load_tiles('resources/images/clouds.png', WIDTH, HEIGHT)

  class << self
    attr_reader :images
  end

  def initialize(pos_x, pos_y)
    @image = self.class.images.sample
    @pos_x = pos_x
    @pos_y = pos_y
    @phase = rand * Math::PI
  end

  def draw
    y_shift = Math.sin(@phase) * AMPLITUDE
    angle_deg = Math.sin(@phase) * TILT_ANGLE
    @image.draw_rot(@pos_x + WIDTH/2, @pos_y + HEIGHT/2 + y_shift, 0,angle_deg)
  end

  def update(elapsed_time)
    @pos_x -= LINEAR_SPEED * elapsed_time
    @phase = (@phase + ANGLE_SPEED * elapsed_time) % Math::PI
  end
end
