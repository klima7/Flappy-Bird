require_relative '../../framework/activity'

class MenuActivity < Activity

  def update
    puts "update menu #{window.nil?}"
  end

end
