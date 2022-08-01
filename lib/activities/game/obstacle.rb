require 'gosu'

require_relative '../common/rectangle'

class Obstacle
  TRUNK_IMAGE = Gosu::Image.new('resources/images/trunk.png')
  HOLE_TOP_IMAGE = Gosu::Image.new('resources/images/hole_top.png')
  HOLE_BOTTOM_IMAGE = Gosu::Image.new('resources/images/hole_bottom.png')

  WIDTH = TRUNK_IMAGE.width
  HEIGHT = TRUNK_IMAGE.height

  RECT_TEMPLATE = Rectangle.new(0, 0, WIDTH, HEIGHT)

  HOLE_TOP_SHIFT = 0
  HOLE_BOTTOM_SHIFT = 0

  attr_reader :pos_x

  def initialize(map, pos_x, hole_pos, hole_size)
    @map = map
    @pos_x = pos_x
    @hole_pos = hole_pos
    @hole_size = hole_size

    @hole_rect_template = create_hole_rect_template
    @image = create_image
  end

  def draw
    @image.draw(@pos_x, 0, 200)
  end

  def behind_left_edge?
    pos_x - @map.shift < -WIDTH
  end

  def collide?(other_rect)
    rect.collide_rectangle(other_rect) ? !hole_rect.collide_rectangle(other_rect) : false
  end

  private

  def rect
    RECT_TEMPLATE.shift(@pos_x, 0)
  end

  def hole_rect
    @hole_rect_template.shift(@pos_x, 0)
  end

  def create_hole_rect_template
    Rectangle.new(0, @hole_pos - @hole_size / 2, WIDTH, @hole_size)
  end

  def create_image
    image = Gosu::Image.new(TRUNK_IMAGE)
    top_y_pos = @hole_rect_template.top - HOLE_TOP_IMAGE.height + HOLE_TOP_SHIFT
    bottom_y_pos = @hole_rect_template.bottom + HOLE_BOTTOM_SHIFT
    transparent_rect = Gosu.render(WIDTH, bottom_y_pos-top_y_pos) do
      Gosu.draw_rect(0, 0, WIDTH, bottom_y_pos-top_y_pos, Gosu::Color::NONE)
    end
    image.insert(transparent_rect, 0, top_y_pos)
    image.insert(HOLE_TOP_IMAGE, 0, top_y_pos)
    image.insert(HOLE_BOTTOM_IMAGE, 0, bottom_y_pos)
    image
  end

end
