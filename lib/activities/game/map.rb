require 'gosu'

require_relative 'background'


class Map
  def initialize
    @background = Background.new
  end

  def draw
    @background.draw
  end

  def update(elapsed_time)
    @background.update(elapsed_time)
  end
end
