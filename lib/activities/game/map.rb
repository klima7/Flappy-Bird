require 'gosu'

require_relative 'background'
require_relative 'flappy_bird'

class Map
  attr_reader :shift

  def initialize
    @background = Background.new(self)
    @flappy_bird = FlappyBird.new(self, 100, 200)
    @shift = 0
  end

  def draw
    @background.draw
    @flappy_bird.draw
  end

  def update(elapsed_time)
    @background.update(elapsed_time)
    @flappy_bird.update(elapsed_time)
    @shift += elapsed_time * 300
  end
end
