require_relative 'landscape'
require_relative 'trees'
require_relative 'clouds'

class Background

  def initialize(map)
    @landscape = Landscape.new(map)
    @trees = Trees.new(map)
    @clouds = Clouds.new
  end

  def draw
    @landscape.draw
    @clouds.draw
    @trees.draw
  end

  def update(elapsed_time)
    @clouds.update(elapsed_time)
    @trees.update(elapsed_time)
  end

end