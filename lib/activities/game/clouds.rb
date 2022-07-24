require_relative '../../framework/window'
require_relative 'cloud'

class Clouds
  DISTANCE = 70

  def initialize
    @clouds = []

    pos = 0
    while pos < Window::WIDTH
      add_cloud(pos)
      pos += Cloud::WIDTH + DISTANCE
    end
  end

  def draw
    @clouds.each(&:draw)
  end

  def update(elapsed_time)
    add_cloud if should_add_cloud?
    @clouds.each { |cloud| cloud.update(elapsed_time) }
    @clouds.delete_if { |cloud| should_remove_cloud?(cloud) }
  end

  def add_cloud(x_pos = Window::WIDTH)
    cloud = Cloud.new(x_pos, 0)
    @clouds << cloud
  end

  def should_add_cloud?
    if @clouds.empty?
      true
    else
      last_cloud = @clouds[-1]
      distance = Window::WIDTH - (last_cloud.pos_x + Cloud::WIDTH)
      distance > DISTANCE
    end
  end

  def should_remove_cloud?(cloud)
    cloud.pos_x + Cloud::WIDTH < 0
  end
end
