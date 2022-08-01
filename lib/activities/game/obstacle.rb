require 'gosu'

require_relative '../common/rectangle'

class Obstacle
  TRUNK_IMAGE = Gosu::Image.new('resources/images/trunk.png')
  HOLE_TOP_IMAGE = Gosu::Image.new('resources/images/hole_top.png')
  HOLE_BOTTOM_IMAGE = Gosu::Image.new('resources/images/hole_bottom.png')

  TRUNK_WIDTH = TRUNK_IMAGE.width

  HOLE_TOP_OFFSET = 0
  HOLE_BOTTOM_OFFSET = 14

  attr_reader :pos_x

  def initialize(map, pos_x, hole_pos, hole_size)
    @map = map
    @pos_x = pos_x
    @hole_pos = hole_pos
    @hole_size = hole_size

    @hole_rect = create_hole_rect
    @image = create_image
  end

  def draw
    draw_x = @pos_x-TRUNK_WIDTH/2
    @image.draw(draw_x, 0, 200)
  end

  def behind_left_edge?
    pos_x - @map.shift < -TRUNK_WIDTH
  end

  private

  def create_hole_rect
    Rectangle.new(0, @hole_pos - @hole_size / 2, TRUNK_WIDTH, @hole_size)
  end

  def create_image
    image = Gosu::Image.new(TRUNK_IMAGE)
    top_y_pos = @hole_rect.top - HOLE_TOP_IMAGE.height + HOLE_TOP_OFFSET
    bottom_y_pos = @hole_rect.bottom + HOLE_BOTTOM_OFFSET
    transparent_rect = Gosu.render(TRUNK_WIDTH, bottom_y_pos-top_y_pos) do
      Gosu.draw_rect(0, 0, TRUNK_WIDTH, bottom_y_pos-top_y_pos, Gosu::Color::NONE)
    end
    image.insert(transparent_rect, 0, top_y_pos)
    image.insert(HOLE_TOP_IMAGE, 0, top_y_pos)
    image.insert(HOLE_BOTTOM_IMAGE, 0, bottom_y_pos)
    image
  end

end
