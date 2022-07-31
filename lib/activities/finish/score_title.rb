require 'gosu'

require_relative '../../framework/window'

class ScoreTitle

  IMAGE = Gosu::Image.new('resources/images/score_title.png')

  ANGLE_SPEED = 1
  AMPLITUDE = 10
  X_POS = (Window::WIDTH - IMAGE.width) / 2
  Y_POS = 100

  def initialize
    @phase = 0
  end

  def draw
    y_pos = Y_POS + Math.sin(@phase) * AMPLITUDE
    IMAGE.draw(X_POS, y_pos)
  end

  def update(elapsed_time)
    @phase += ANGLE_SPEED * elapsed_time
  end

end
