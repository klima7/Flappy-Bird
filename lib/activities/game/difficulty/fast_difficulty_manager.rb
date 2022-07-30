require_relative 'base_difficulty_manager'

class FastDifficultyManager < BaseDifficultyManager

  def min_hole_height
    100
  end

  def max_hole_height
    500
  end

  def distance_between_obstacles
    600
  end

  def bird_speed
    300
  end

end
