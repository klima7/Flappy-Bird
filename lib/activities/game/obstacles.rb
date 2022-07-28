require 'gosu'

require_relative 'obstacle'

class Obstacles
  RUNUP_DISTANCE = 1600

  def initialize(map)
    @map = map
    @obstacles = []

    for i in 1..100 do
      @obstacles << Obstacle.new(self, 600 + i * 400, rand(100..500))
    end
  end

  def draw
    @obstacles.each(&:draw)
  end

  def update

  end
end
