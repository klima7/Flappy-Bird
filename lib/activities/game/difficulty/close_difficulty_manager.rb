require_relative 'base_difficulty_manager'

class CloseDifficultyManager < BaseDifficultyManager

  def hole_pos
    rand(100..500)
  end

  def hole_size
    rand(70..200)
  end

  def distance_between_obstacles
    600
  end

  def bird_speed
    300
  end

end
