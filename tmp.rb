class Point
  def say_hi
    puts "Hi"
  end
end

arr = [Point.new, Point.new]
arr.each(&:say_hi)