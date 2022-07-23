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

    @last_update_time = current_time_ms
  end

  def activity=(activity)
    activity.window = self
    @activity = activity
  end

  def update
    this_update_time = current_time_ms
    elapsed_time =@last_update_time - this_update_time
    @last_update_time = this_update_time
    @activity.update elapsed_time
  end

  def draw
    @activity.draw
  end

  def close
    @activity.close
  end

  private

  def current_time_ms
    (Time.now.to_f * 1000).to_i
  end

end

