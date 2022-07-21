require "gosu"

class Window < Gosu::Window

  WIDTH = 800
  HEIGHT = 600
  CAPTION = 'Flappy Bird'
  FPS = 60

  def initialize(activity)
    super WIDTH, HEIGHT, { :update_interval => 1000 / FPS }
    self.caption = CAPTION

    activity.window = self
    @activity = activity
  end

  def activity=(activity)
    activity.window = self
    @activity = activity
  end

  def update
    @activity.update
  end

  def draw
    @activity.draw
  end

  def close
    @activity.close
  end

end

