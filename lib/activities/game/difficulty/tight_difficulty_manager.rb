require_relative 'base_difficulty_manager'

class TightDifficultyManager < BaseDifficultyManager

  def _hole_pos
    rand(100..500)
  end

  def _hole_size
    rand(70..200)
  end

  def _distance_between_obstacles
    600
  end

  def _bird_speed
    300
  end

end
