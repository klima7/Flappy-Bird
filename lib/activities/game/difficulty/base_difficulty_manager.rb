class BaseDifficultyManager

  def bind(map)
    @map = map
  end

  def min_hole_height
    raise NotImplementedError.new
  end

  def max_hole_height
    raise NotImplementedError.new
  end

  def distance_between_obstacles
    raise NotImplementedError.new
  end

  def bird_speed
    raise NotImplementedError.new
  end

  private

  def score
    @map.score
  end

end
