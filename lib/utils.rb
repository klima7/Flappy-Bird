require 'gosu'
require_relative 'framework/window'

def fill_screen(color)
  Gosu.draw_rect(0, 0, Window::WIDTH, Window::HEIGHT, color)
end