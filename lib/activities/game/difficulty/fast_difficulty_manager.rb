require_relative 'base_difficulty_manager'

class FastDifficultyManager < BaseDifficultyManager

  def _hole_pos
    rand(200..400)
  end

  def _hole_size
    150
  end

  def _distance_between_obstacles
    600
  end

  def _bird_speed
    if score < 5
      200 + score*20
    elsif score < 25
      200 + 5*20 + (score-5)*10
    else
      [200 + 5*20 + 15*10 + (score-25)*5 , 600].min
    end
  end

end
