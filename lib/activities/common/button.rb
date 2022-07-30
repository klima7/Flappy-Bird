require 'gosu'

require_relative '../../framework/window'

class Button

  DEFAULT_TEXT_COLOR = Gosu::Color::BLACK
  DEFAULT_INACTIVE_COLOR = Gosu::Color::YELLOW
  DEFAULT_ACTIVE_COLOR = Gosu::Color::RED
  DEFAULT_FONT_HEIGHT = 30
  DEFAULT_VERTICAL_PADDING = 10
  DEFAULT_Z_ORDER = 1000

  def initialize(text, pos_x, pos_y, options={}, &callback)
    @text = text
    @pos_x = pos_x
    @pos_y = pos_y
    @callback = callback
    @active = false

    @text_color = options.fetch(:text_color, DEFAULT_TEXT_COLOR)
    @inactive_color = options.fetch(:inactive_color, DEFAULT_INACTIVE_COLOR)
    @active_color = options.fetch(:active_color, DEFAULT_ACTIVE_COLOR)
    @font_height = options.fetch(:font_height, DEFAULT_FONT_HEIGHT)
    @z_order = options.fetch(:z_order, DEFAULT_Z_ORDER)
    @vertical_padding = options.fetch(:vertical_padding, DEFAULT_VERTICAL_PADDING)
    @width = options[:width]

    @text_image = create_text_image
    @inactive_image = create_button_image(@inactive_color)
    @active_image = create_button_image(@active_color)
  end

  def draw
    @text_image.draw(@pos_x, @pos_y, @z_order, 1, 1, @text_color)
  end

  def update(elapsed_time)
    mx, my = $window.mouse_x, $window.mouse_y
  end

  private

  def create_text_image
    Gosu::Image.from_markup(@text, @font_height)
  end

  def create_button_image(color)

  end

end
