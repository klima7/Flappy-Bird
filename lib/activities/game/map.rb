require 'gosu'

require_relative 'flappy_bird'
require_relative '../common/background'
require_relative 'obstacles'
require_relative 'score_drawer'

class Map

  BIRD_DISTANCE_FROM_EDGE = 80

  attr_reader :shift, :score, :flappy_bird, :dm

  def initialize(difficulty_manager)
    difficulty_manager.bind(self)

    @dm = difficulty_manager
    @background = Background.new
    @flappy_bird = FlappyBird.new(self, 100, 200)
    @obstacles = Obstacles.new(self)
    @score_drawer = ScoreDrawer.new(self)
    @shift = 0
    @score = 0
  end

  def draw
    @background.draw(shift)
    @score_drawer.draw

    Gosu.translate(-shift, 0) do
      @flappy_bird.draw
      @obstacles.draw
    end
  end

  def update(elapsed_time)
    @background.update(elapsed_time)
    update_bird_and_score(elapsed_time)
    @obstacles.update(elapsed_time)
    @shift = @flappy_bird.pos_x - BIRD_DISTANCE_FROM_EDGE
  end

  private

  def update_bird_and_score(elapsed_time)
    before_count = obstacles_behind_bird_count
    @flappy_bird.update(elapsed_time)
    after_count = obstacles_behind_bird_count
    count_difference = after_count - before_count
    @score += count_difference if @flappy_bird.alive?
  end

  def obstacles_behind_bird_count
    @obstacles.count {|obstacle| obstacle.pos_x < @flappy_bird.pos_x}
  end

end
