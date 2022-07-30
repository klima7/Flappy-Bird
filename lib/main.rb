require_relative 'activities/game/game' # TODO: Remove
require_relative 'activities/menu/menu'
require_relative 'framework/window'

if __FILE__ == $0
  $window.activity = MenuActivity.new
  $window.show
end
