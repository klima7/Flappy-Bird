require_relative 'base_difficulty_manager'

class CloseDifficultyManager < BaseDifficultyManager

  def _hole_pos
    rand(200..400)
  end

  def _hole_size
    150
  end

  def _distance_between_obstacles
    if score < 5
      800 - score*40
    elsif score < 20
      800 - 5*40 - (score-5)*15
    else
      [200 + 5*20 + 15*15 + (score-20)*10 , 250].max
    end
  end

  def _bird_speed
    300
  end

end
