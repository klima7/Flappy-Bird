require 'gosu'

require_relative '../../framework/window'

class Button

  DEFAULT_TEXT_COLOR = Gosu::Color::BLACK
  DEFAULT_INACTIVE_COLOR = Gosu::Color::YELLOW
  DEFAULT_ACTIVE_COLOR = Gosu::Color::RED
  DEFAULT_BORDER_COLOR = Gosu::Color::BLACK

  DEFAULT_BORDER_WIDTH = 4
  DEFAULT_FONT_HEIGHT = 30
  DEFAULT_PADDING = 10
  DEFAULT_Z_ORDER = 1000

  DEFAULT_AMPLITUDE = 0
  DEFAULT_ANGLE_SPEED = 4

  def initialize(text, pos_x, pos_y, options={}, &callback)
    @text = text
    @pos_x = pos_x
    @pos_y = pos_y
    @callback = callback
    @active = false

    @text_color = options.fetch(:text_color, DEFAULT_TEXT_COLOR)
    @active_text_color = options.fetch(:text_color, @text_color)
    @inactive_color = options.fetch(:inactive_color, DEFAULT_INACTIVE_COLOR)
    @active_color = options.fetch(:active_color, DEFAULT_ACTIVE_COLOR)
    @font_height = options.fetch(:font_height, DEFAULT_FONT_HEIGHT)
    @z_order = options.fetch(:z_order, DEFAULT_Z_ORDER)
    @padding = options.fetch(:padding, DEFAULT_PADDING)
    @border_color = options.fetch(:border_color, DEFAULT_BORDER_COLOR)
    @border_width = options.fetch(:border_width, DEFAULT_BORDER_WIDTH)
    @phase = options.fetch(:initial_phase, rand % 2*Math::PI)
    @angle_speed = options.fetch(:angle_speed, DEFAULT_ANGLE_SPEED)
    @amplitude = options.fetch(:amplitude, DEFAULT_AMPLITUDE)
    @width = options[:width]

    @bounce_shift = 0

    @inactive_image = create_button_image(@inactive_color, @text_color)
    @active_image = create_button_image(@active_color, @active_text_color)
  end

  def draw
    image = @active ? @active_image : @inactive_image
    image.draw(@pos_x, @pos_y + @bounce_shift, @z_order)
  end

  def update(elapsed_time)
    mx, my = $window.mouse_x, $window.mouse_y
    @active = mx >= real_x && mx <= real_x + width && my >= @pos_y && my <= @pos_y + height
    @callback.call if @active && Gosu.button_down?(Gosu::MS_LEFT)
    @phase += @angle_speed * elapsed_time
    @bounce_shift = Math.sin(@phase) * @amplitude
  end

  def width
    @active_image.width
  end

  def height
    @active_image.height
  end

  private

  def create_button_image(bg_color, text_color)
    font = Gosu::Font.new(@font_height)

    text_width = font.markup_width(@text)
    button_width = (@width || text_width + 2 * @padding).to_i
    button_height = (@font_height + 2 * @padding).to_i

    text_x = (button_width - text_width) / 2
    text_y = (button_height - @font_height) / 2

    Gosu.render(button_width, button_height) do
      Gosu.draw_rect(0, 0, button_width, button_height, @border_color)
      Gosu.draw_rect(@border_width, @border_width, button_width-2*@border_width, button_height-2*@border_width, bg_color)
      font.draw_markup(@text, text_x, text_y, 0, 1, 1, text_color)
    end
  end

  def real_x
    @pos_x + @bounce_shift
  end

end
