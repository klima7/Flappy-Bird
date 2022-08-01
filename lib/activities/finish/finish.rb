require 'gosu'

require_relative '../../framework/activity'
require_relative '../common/background'
require_relative '../menu/menu'
require_relative '../game/game'
require_relative 'score_title'
require_relative '../../framework/window'

class FinishActivity < Activity

  BACKGROUND_SPEED = 100
  TRUNK_IMAGE = Gosu::Image.new('resources/images/trunk.png')
  BUTTONS_AMPLITUDE = 5
  FONT_HEIGHT = 100
  FONT = Gosu::Font.new(FONT_HEIGHT)
  SCORE_PADDING = 20
  SCORE_BORDER = 3

  def initialize(score, mode)
    @score = score
    @mode = mode

    @background = Background.new
    @background_shift = 0

    @retry_button = Button.new(
      'Retry', 225, 400,
      width: 150,
      amplitude: BUTTONS_AMPLITUDE,
      initial_phase: 0
    ) { go_to_game }

    @menu_button = Button.new(
      'Menu', 425, 400,
      width: 150,
      amplitude: BUTTONS_AMPLITUDE,
      initial_phase: Math::PI
    ) { go_to_menu }

    @score_title = ScoreTitle.new
  end

  def draw
    @background.draw(@background_shift)
    @retry_button.draw
    @menu_button.draw
    @score_title.draw
    TRUNK_IMAGE.draw(50, 0, 1000)
    TRUNK_IMAGE.draw(650, 0, 1000)
    draw_score
  end

  def update(elapsed_time)
    @background.update(elapsed_time)
    @retry_button.update(elapsed_time)
    @menu_button.update(elapsed_time)
    @score_title.update(elapsed_time)
    @background_shift += BACKGROUND_SPEED * elapsed_time
  end

  private

  def go_to_menu
    window.activity = MenuActivity.new
  end

  def go_to_game
    window.activity = GameActivity.new(@mode)
  end

  def draw_score
    text = "<b>#{@score}</b>"
    text_width = FONT.markup_width(text)
    x_pos = (Window::WIDTH - text_width) / 2
    y_pos = (Window::HEIGHT - FONT_HEIGHT) / 2
    Gosu.draw_rect(x_pos-SCORE_PADDING-SCORE_BORDER, y_pos-SCORE_BORDER, text_width+2*SCORE_PADDING+2*SCORE_BORDER, FONT_HEIGHT+2*SCORE_BORDER, Gosu::Color::BLACK)
    Gosu.draw_rect(x_pos-SCORE_PADDING, y_pos, text_width+2*SCORE_PADDING, FONT_HEIGHT, Gosu::Color::WHITE)
    FONT.draw_markup(text, x_pos, y_pos, 1000, 1, 1, Gosu::Color::BLACK)
  end

end
