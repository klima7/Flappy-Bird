require 'gosu'

require_relative 'landscape'
require_relative 'flappy_bird'
require_relative 'clouds'
require_relative 'trees'
require_relative 'obstacles'

class Map
  BIRD_DISTANCE_FROM_EDGE = 80
  FONT = Gosu::Font.new(35)

  attr_reader :shift

  def initialize
    @landscape = Landscape.new(self)
    @clouds = Clouds.new
    @trees = Trees.new(self)
    @flappy_bird = FlappyBird.new(self, 100, 200)
    @obstacles = Obstacles.new(self)

    @shift = 0
    @score = 0
  end

  def draw
    @landscape.draw
    @clouds.draw
    @trees.draw
    draw_score

    Gosu.translate(-shift, 0) do
      @flappy_bird.draw
      @obstacles.draw
    end
  end

  def update(elapsed_time)
    @clouds.update(elapsed_time)
    @trees.update(elapsed_time)
    @flappy_bird.update(elapsed_time)

    @shift = @flappy_bird.pos_x - BIRD_DISTANCE_FROM_EDGE
  end

  def flap
    @flappy_bird.flap
  end

  def increase_score
    @score += 1
  end

  private

  def draw_score
    FONT.draw_markup("<b>Score: #{@score}</b>", 10, 10, 1000, 1, 1, Gosu::Color::BLACK)
  end
end
