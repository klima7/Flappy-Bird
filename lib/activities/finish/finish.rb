require_relative '../../framework/activity'

class FinishActivity < Activity

  def initialize(score)
    @score = score
  end

  def update(elapsed_time)
  end

end
