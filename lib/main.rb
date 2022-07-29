require_relative 'activities/game/game' # TODO: Remove
require_relative 'activities/menu/menu'
require_relative 'framework/window'

window = Window.new(MenuActivity.new)
window.show if __FILE__ == $0
