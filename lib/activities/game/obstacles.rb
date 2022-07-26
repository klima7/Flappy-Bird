require 'gosu'

require_relative 'obstacle'

class Obstacles
  def initialize(map)
    @map = map
    @obstacles = []

    @obstacles << Obstacle.new(self, 300, 300)
    @obstacles << Obstacle.new(self, 500, 100)
    @obstacles << Obstacle.new(self, 700, 500)
  end

  def draw
    Gosu.translate(-@map.shift, 0) do
      @obstacles.each(&:draw)
    end
  end
end
