require 'gosu'

def fill_screen(color)
  width = Gosu.screen_width
  height = Gosu.screen_width
  Gosu.draw_rect(0, 0, width, height, color)
end