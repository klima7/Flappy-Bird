require_relative 'background/landscape'
require_relative 'background/trees'
require_relative 'background/clouds'

class Background

  def initialize
    @landscape = Landscape.new
    @trees = Trees.new
    @clouds = Clouds.new
  end

  def draw(shift)
    @landscape.draw(shift)
    @trees.draw(shift)
    @clouds.draw
  end

  def update(elapsed_time)
    @clouds.update(elapsed_time)
    @trees.update(elapsed_time)
  end

end