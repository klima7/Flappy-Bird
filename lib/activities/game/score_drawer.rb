require 'gosu'

class ScoreDrawer
  FONT = Gosu::Font.new(35)

  def initialize(map)
    @map = map
  end

  def draw
    text = "<b>Score: #{@map.score}</b>"
    FONT.draw_markup(text, 10, 10, 1000, 1, 1, Gosu::Color::BLACK)
  end

end
