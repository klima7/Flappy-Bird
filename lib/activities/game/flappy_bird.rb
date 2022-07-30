require 'gosu'

class FlappyBird

  IMAGE = Gosu::Image.new('resources/images/flappy_bird.png')

  WIDTH = 87
  HEIGHT = 44

  GRAVITY_ACCELERATION = 700
  FLAP_VELOCITY = -300
  MAX_FALL_VELOCITY = 500

  FLAP_ANGLE = -20
  FALL_ANGLE = 25

  attr_reader :pos_x, :pos_y

  def initialize(map, pos_x, pos_y)
    @map = map
    @pos_x = pos_x
    @pos_y = pos_y
    @velocity = 0
  end

  def draw
    IMAGE.draw_rot(@pos_x + WIDTH/2, @pos_y + HEIGHT/2, 0, angle)
  end

  def update(elapsed_time)
    @pos_x += elapsed_time * @map.dm.bird_speed
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
