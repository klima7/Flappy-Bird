require 'gosu'

require_relative 'background'
require_relative 'flappy_bird'
require_relative 'clouds'

class Map
  attr_reader :shift

  def initialize
    @background = Background.new(self)
    @clouds = Clouds.new
    @flappy_bird = FlappyBird.new(self, 100, 200)
    @shift = 0
  end

  def draw
    @background.draw
    @flappy_bird.draw
    @clouds.draw
    @background.draw_trees
  end

  def update(elapsed_time)
    @clouds.update(elapsed_time)
    @flappy_bird.update(elapsed_time)
    @shift += elapsed_time * 300
  end

  def flap
    @flappy_bird.flap
  end
end
