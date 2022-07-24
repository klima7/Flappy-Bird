require_relative '../../framework/activity'
require_relative 'map'

class GameActivity < Activity

  def initialize
    @map = Map.new
  end

  def draw
    @map.draw
  end

  def update(elapsed_time)
    @map.draw
  end

end
