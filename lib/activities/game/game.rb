require 'gosu'

require_relative '../../framework/activity'
require_relative 'map'

class GameActivity < Activity

  def initialize
    @map = Map.new
  end

  def draw
    @map.draw
  end

  def update(elapsed_time)
    @map.update elapsed_time
  end

  def button_down(id)
    @map.flap if id == Gosu::KB_SPACE
  end

end
