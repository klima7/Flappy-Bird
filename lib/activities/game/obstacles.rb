require 'gosu'

require_relative 'obstacle'

class Obstacles
  include Enumerable

  RUN_UP_DISTANCE = 1600
  AHEAD_COUNT = 5

  def initialize(map)
    @map = map
    @obstacles = []
    @count = 0

    add_obstacle(RUN_UP_DISTANCE)
    (AHEAD_COUNT-1).times {add_obstacle }
  end

  def draw
    @obstacles.each(&:draw)
  end

  def each
    @obstacles.each {|obstacle| yield obstacle}
  end

  def update(elapsed_time)
    start_size = @obstacles.size
    @obstacles.delete_if(&:behind_left_edge?)
    removed_obstacles = start_size - @obstacles.size
    removed_obstacles.times {add_obstacle}
  end

  def collide?(rectangle)
    @obstacles.any? {|obstacle| obstacle.collide?(rectangle) }
  end

  private

  def add_obstacle(pos_x=nil)
    pos_x ||= @obstacles.last.pos_x + @map.dm.distance_between_obstacles(@count)
    @obstacles << Obstacle.new(@map, pos_x, @map.dm.hole_pos(@count), @map.dm.hole_size(@count))
    @count += 1
  end

end
