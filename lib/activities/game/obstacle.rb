require 'gosu'

class Obstacle
  TRUNK_IMAGE = Gosu::Image.new('resources/images/trunk.png')
  HOLE_IMAGE = Gosu::Image.new('resources/images/trunk_hole.png')

  TRUNK_WIDTH = TRUNK_IMAGE.width
  HOLE_HEIGHT = HOLE_IMAGE.height

  def initialize(map, pos_x, hole_height)
    @map = map
    @pos_x = pos_x
    @pos_hole = hole_height
    @image = create_image
  end

  def draw
    draw_x = @pos_x-TRUNK_WIDTH/2
    @image.draw(draw_x, 0, 0)
  end

  def update(elapsed_time)
  end

  private

  def create_image
    image = Gosu::Image.new(TRUNK_IMAGE)
    image.insert(HOLE_IMAGE, 0, @pos_hole-HOLE_HEIGHT/2)
    image
  end
end
