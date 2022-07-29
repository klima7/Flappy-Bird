require 'gosu'

require_relative 'obstacle'

class Obstacles
  include Enumerable

  RUN_UP_DISTANCE = 1600
  AHEAD_COUNT = 5

  def initialize(map)
    @map = map
    @obstacles = []

    obstacle = Obstacle.new(@map, RUN_UP_DISTANCE, rand(@map.dm.min_hole_height..@map.dm.max_hole_height))
    @obstacles << obstacle
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

  private

  def add_obstacle
    pos_x = @obstacles.last.pos_x + @map.dm.distance_between_obstacles
    @obstacles << Obstacle.new(@map, pos_x, rand(@map.dm.min_hole_height..@map.dm.max_hole_height))
  end
end
