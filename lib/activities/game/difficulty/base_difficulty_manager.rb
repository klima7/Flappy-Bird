class BaseDifficultyManager

  def bind(map)
    @map = map
    @temporary_score = nil
  end

  def hole_pos(score = nil)
    @temporary_score = score
    result = _hole_pos
    @temporary_score = nil
    result
  end

  def hole_size(score = nil)
    @temporary_score = score
    result = _hole_size
    @temporary_score = nil
    result
  end

  def distance_between_obstacles(score = nil)
    @temporary_score = score
    result = _distance_between_obstacles
    @temporary_score = nil
    result
  end

  def bird_speed(score = nil)
    @temporary_score = score
    result = _bird_speed
    @temporary_score = nil
    result
  end

  private

  def _hole_pos
    raise NotImplementedError.new
  end

  def _hole_size
    raise NotImplementedError.new
  end

  def _distance_between_obstacles
    raise NotImplementedError.new
  end

  def _bird_speed
    raise NotImplementedError.new
  end

  def score
    @temporary_score || @map.score
  end

end
