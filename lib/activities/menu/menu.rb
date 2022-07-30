require_relative '../../framework/activity'
require_relative '../common/background'
require_relative '../common/button'
require_relative '../game/game'
require_relative 'title'

class MenuActivity < Activity

  BACKGROUND_SPEED = 300
  BUTTONS_AMPLITUDE = 5

  def initialize
    @background = Background.new
    @title = Title.new
    @background_shift = 0

    @close_button = Button.new(
      'Close', 125, 300,
      width: 150,
      amplitude: BUTTONS_AMPLITUDE,
      initial_phase: 0
    ) { start_game(:close) }

    @fast_button = Button.new(
      'Fast', 325, 300,
      width: 150,
      amplitude: BUTTONS_AMPLITUDE,
      initial_phase: 1
    ) { start_game(:fast) }

    @tight_button = Button.new(
      'Tight', 525, 300,
      width: 150,
      amplitude: BUTTONS_AMPLITUDE,
      initial_phase: 2
    ) { start_game(:tight) }

    @exit_button = Button.new(
      'Exit', 10, 10,
      width: 150,
      z_order: -2500,
      inactive_color: Gosu::Color::WHITE,
      active_color: Gosu::Color::RED
    ) { exit }
  end

  def draw
    @background.draw(@background_shift)
    @title.draw
    @close_button.draw
    @fast_button.draw
    @tight_button.draw
    @exit_button.draw
  end

  def update(elapsed_time)
    @background.update(elapsed_time)
    @title.update(elapsed_time)
    @close_button.update(elapsed_time)
    @fast_button.update(elapsed_time)
    @tight_button.update(elapsed_time)
    @exit_button.update(elapsed_time)
    @background_shift += BACKGROUND_SPEED * elapsed_time
  end

  private

  def start_game(mode)
    window.activity = GameActivity.new(mode)
  end

  def exit
    window.close
  end

end
