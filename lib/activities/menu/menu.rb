require_relative '../../framework/activity'
require_relative '../common/background'

class MenuActivity < Activity

  BACKGROUND_SPEED = 300

  def initialize
    @background = Background.new
    @background_shift = 0
  end

  def draw
    @background.draw(@background_shift)
  end

  def update(elapsed_time)
    @background.update(elapsed_time)
    @background_shift += BACKGROUND_SPEED * elapsed_time
  end

end
