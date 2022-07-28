require 'gosu'

require_relative 'obstacle'

class Obstacles
  include Enumerable

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

  def each
    @obstacles.each {|obstacle| yield obstacle}
  end

  def update(elapsed_time)

  end
end
