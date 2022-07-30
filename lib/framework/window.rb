require 'gosu'

class Window < Gosu::Window

  WIDTH = 800
  HEIGHT = 600
  CAPTION = 'Flappy Bird'
  FPS = 200

  def initialize
    super WIDTH, HEIGHT, { :update_interval => 1000 / FPS }
    self.caption = CAPTION

    @activity = nil
    @last_update_time = Time.now.to_f
  end

  def activity=(activity)
    activity.window = self
    @activity = activity
  end

  def update
    this_update_time = Time.now.to_f
    elapsed_time = this_update_time - @last_update_time
    @last_update_time = this_update_time
    @activity&.update elapsed_time
  end

  def draw
    @activity&.draw
  end

  def close
    @activity&.close
  end

  def button_down(id)
    @activity&.button_down(id)
  end

  def button_up(id)
    @activity&.button_up(id)
  end

end

$window = Window.new
