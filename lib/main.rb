require_relative 'activities/game/game'
require_relative 'framework/window'

window = Window.new(GameActivity.new)
window.show if __FILE__ == $0
