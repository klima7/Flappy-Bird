class BaseDifficultyManager

  def bind(map)
    @map = map
  end

  def hole_pos
    raise NotImplementedError.new
  end

  def hole_size
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
