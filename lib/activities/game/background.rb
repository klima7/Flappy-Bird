require 'gosu'

require_relative '../../utils'
require_relative 'clouds'

class Background
  def initialize(map)
    @map = map
    @clouds = Clouds.new
  end

  def draw
    fill_screen(Gosu::Color::WHITE)
    @clouds.draw
  end

  def update(elapsed_time)
    @clouds.update(elapsed_time)
  end
end
