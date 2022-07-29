require 'gosu'

require_relative '../../framework/activity'
require_relative 'difficulty_manager'
require_relative 'map'

class GameActivity < Activity

  def initialize
    df = DifficultyManager.new
    @map = Map.new(df)
  end

  def draw
    @map.draw
  end

  def update(elapsed_time)
    @map.update elapsed_time
  end

  def button_down(id)
    @map.flappy_bird.flap if [Gosu::KB_SPACE, Gosu::MS_LEFT].include?(id)
  end

end
