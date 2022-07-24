require 'gosu'

require_relative 'background'


class Map
  attr_reader :shift

  def initialize
    @background = Background.new(self)
    @shift = 0
  end

  def draw
    @background.draw
  end

  def update(elapsed_time)
    @background.update(elapsed_time)
    @shift += elapsed_time * 300
  end
end
