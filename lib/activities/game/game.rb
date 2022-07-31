require 'gosu'

require_relative '../../framework/activity'
require_relative '../menu/menu'
require_relative 'difficulty/close_difficulty_manager'
require_relative 'difficulty/fast_difficulty_manager'
require_relative 'difficulty/tight_difficulty_manager'
require_relative 'map'

class GameActivity < Activity

  def initialize(mode)
    difficulty_manager = get_difficulty_manager(mode)
    @map = Map.new(difficulty_manager)
  end

  def draw
    @map.draw
  end

  def update(elapsed_time)
    @map.update elapsed_time
  end

  def button_down(id)
    @map.flappy_bird.flap if [Gosu::KB_SPACE, Gosu::MS_LEFT].include?(id)
    @map.flappy_bird.die if [Gosu::KB_D].include?(id)
    window.activity = MenuActivity.new if id == Gosu::KB_ESCAPE
  end

  private

  def get_difficulty_manager(mode)
    case(mode)
    when :close
      CloseDifficultyManager.new
    when :fast
      FastDifficultyManager.new
    when :tight
      TightDifficultyManager.new
    else
      raise ArgumentError.new("Unknown mode: #{mode}")
    end
  end

end
