require_relative 'base_difficulty_manager'

class TightDifficultyManager < BaseDifficultyManager

  def _hole_pos
    rand(100..500)
  end

  def _hole_size
    if score < 20
      400 - score * 10
    else
      [400 - 20*10 - (score-20)*5, 80].max
    end
  end

  def _distance_between_obstacles
    600
  end

  def _bird_speed
    300
  end

end
