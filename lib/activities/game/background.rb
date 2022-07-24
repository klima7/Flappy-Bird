require 'gosu'

require_relative '../../utils'

class Background
  def initialize(map)
    @map = map
  end

  def draw
    fill_screen(Gosu::Color::WHITE)
    puts 'drawing background'
  end

  def update(elapsed_time)
    puts 'updating background'
  end
end
