require_relative 'menu'
require_relative 'framework/window'

window = Window.new(MenuActivity.new)
window.show if __FILE__ == $0
