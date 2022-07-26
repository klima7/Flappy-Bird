require 'gosu'

require_relative 'landscape'
require_relative 'flappy_bird'
require_relative 'clouds'
require_relative 'trees'
require_relative 'obstacle'

class Map
  attr_reader :shift

  def initialize
    @background = Landscape.new(self)
    @clouds = Clouds.new
    @trees = Trees.new(self)
    @flappy_bird = FlappyBird.new(self, 100, 200)
    @obstacles = []
    @shift = 0

    @obstacles << Obstacle.new(self, 300, 300)
    @obstacles << Obstacle.new(self, 500, 100)
    @obstacles << Obstacle.new(self, 700, 500)
  end

  def draw
    @background.draw
    @flappy_bird.draw
    @clouds.draw
    @trees.draw

    @obstacles.each(&:draw)
  end

  def update(elapsed_time)
    @clouds.update(elapsed_time)
    @flappy_bird.update(elapsed_time)
    @trees.update(elapsed_time)
    @shift += elapsed_time * 300
  end

  def flap
    @flappy_bird.flap
  end
end
