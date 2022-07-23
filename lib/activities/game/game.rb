require_relative '../../framework/activity'

class GameActivity < Activity

  def draw
    puts "draw game"
  end

  def update(elapsed_time)
    puts "update game"
  end

end
