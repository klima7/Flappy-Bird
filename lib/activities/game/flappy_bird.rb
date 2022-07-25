require 'gosu'

class FlappyBird
  WIDTH = 87
  HEIGHT = 44

  GRAVITY_ACCELERATION = 400
  FLAP_VELOCITY = 250

  @image = Gosu::Image.new('resources/images/flappy_bird.png')

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
    angle_deg = 0
    self.class.image.draw_rot(@pos_x + WIDTH/2, @pos_y + HEIGHT/2, 0, angle_deg)
  end

  def update(elapsed_time)
    @pos_y += @velocity * elapsed_time
    @velocity += GRAVITY_ACCELERATION * elapsed_time
  end

  def flap
    @velocity = -FLAP_VELOCITY
  end
end
