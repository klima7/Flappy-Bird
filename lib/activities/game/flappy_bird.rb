require 'gosu'

class FlappyBird
  WIDTH = 87
  HEIGHT = 44

  GRAVITY_ACCELERATION = 700
  FLAP_VELOCITY = -300
  MAX_FALL_VELOCITY = 500
  FORWARD_VELOCITY = 300

  FLAP_ANGLE = -20
  FALL_ANGLE = 25

  @image = Gosu::Image.new('resources/images/flappy_bird.png')

  attr_reader :pos_x, :pos_y

  class << self
    attr_reader :image
  end

  def initialize(map, pos_x, pos_y)
    @map = map

    @pos_x = pos_x
    @pos_y = pos_y
    @velocity = 0
  end

  def draw
    self.class.image.draw_rot(@pos_x + WIDTH/2, @pos_y + HEIGHT/2, 0, angle)
  end

  def update(elapsed_time)
    @pos_x += elapsed_time * FORWARD_VELOCITY
    @pos_y += @velocity * elapsed_time
    @velocity = [@velocity + GRAVITY_ACCELERATION * elapsed_time, MAX_FALL_VELOCITY].min
  end

  def flap
    @velocity = FLAP_VELOCITY
  end

  def angle
    if @velocity < 0
      @velocity * FLAP_ANGLE / FLAP_VELOCITY
    else
      @velocity * FALL_ANGLE / MAX_FALL_VELOCITY
    end
  end
end
