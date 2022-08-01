require 'gosu'

require_relative '../../framework/window'

class FlappyBird

  LIFE_IMAGE = Gosu::Image.new('resources/images/flappy_bird.png')
  DEAD_IMAGE = Gosu::Image.new('resources/images/flappy_bird_dead.png')

  LIFE_Z_ORDER = 0
  DEAD_Z_ORDER = 1000

  WIDTH = LIFE_IMAGE.width
  HEIGHT = LIFE_IMAGE.height

  GRAVITY_ACCELERATION = 700
  FLAP_VELOCITY = -300
  MAX_FALL_VELOCITY = 500

  FLAP_ANGLE = -20
  FALL_ANGLE = 25

  DIE_VELOCITY = -300
  DIE_ANGLE_VELOCITY = -180
  DIE_FALL_DEPTH = 400

  attr_reader :pos_x, :pos_y

  def initialize(map, pos_x, pos_y)
    @map = map
    @pos_x = pos_x
    @pos_y = pos_y
    @velocity = 0
    @angle = 0
    @dead = false
  end

  def draw
    image.draw_rot(@pos_x + WIDTH/2, @pos_y + HEIGHT/2, z_order, @angle)
  end

  def update(elapsed_time)
    @pos_x += elapsed_time * bird_speed
    @pos_y += @velocity * elapsed_time
    @velocity = [@velocity + GRAVITY_ACCELERATION * elapsed_time, MAX_FALL_VELOCITY].min
    update_angle(elapsed_time)
  end

  def flap
    @velocity = FLAP_VELOCITY if alive?
  end

  def die
    @velocity = DIE_VELOCITY
    @dead = true
  end

  def alive?
    not @dead
  end

  def dead?
    @dead
  end

  def fallen_dead?
    dead? && pos_y > Window::HEIGHT + DIE_FALL_DEPTH
  end

  private

  def image
    alive? ? LIFE_IMAGE : DEAD_IMAGE
  end

  def z_order
    alive? ? LIFE_Z_ORDER : DEAD_Z_ORDER
  end

  def bird_speed
    dm_speed = @map.dm.bird_speed
    alive? ? dm_speed : dm_speed / 2
  end

  def update_angle(elapsed_time)
    if alive?
      @angle = angle_from_velocity
    else
      @angle += DIE_ANGLE_VELOCITY * elapsed_time
    end
  end

  def angle_from_velocity
    if @velocity < 0
      @velocity * FLAP_ANGLE / FLAP_VELOCITY
    else
      @velocity * FALL_ANGLE / MAX_FALL_VELOCITY
    end
  end

end
