require_relative '../../framework/activity'
require_relative '../common/background'
require_relative '../menu/menu'
require_relative '../game/game'
require_relative 'score_title'

class FinishActivity < Activity

  BACKGROUND_SPEED = 100
  TRUNK_IMAGE = Gosu::Image.new('resources/images/trunk.png')
  BUTTONS_AMPLITUDE = 5

  def initialize(score, mode)
    @score = score
    @mode = mode

    @background = Background.new
    @background_shift = 0

    @retry_button = Button.new(
      'Retry', 225, 500,
      width: 150,
      amplitude: BUTTONS_AMPLITUDE,
      initial_phase: 0
    ) { go_to_game }

    @menu_button = Button.new(
      'Menu', 425, 500,
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

end
