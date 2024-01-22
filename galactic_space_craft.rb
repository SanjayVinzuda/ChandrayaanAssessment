require 'pry'

class GalacticSpaceCraft
  attr_accessor :position, :direction

  def initialize(starting_point, initial_direction)
    @position = starting_point
    @direction = initial_direction
  end

  def process_commands(commands)
    commands.each do |command|
      case command
      when 'f', 'b'
        move(command)
      when 'l', 'r'
        turn(command)
      when 'u', 'd'
        rotate_angle(command)
      end
    end
  end

  private

  def move(direction)
    case @direction
    when 'N'
      direction == 'f' ? @position[1] += 1 : @position[1] -= 1
    when 'S'
      direction == 'f' ? @position[1] -= 1 : @position[1] += 1
    when 'E'
      direction == 'f' ? @position[0] += 1 : @position[0] -= 1
    when 'W'
      direction == 'f' ? @position[0] -= 1 : @position[0] += 1
    when 'Up'
      direction == 'f' ? @position[2] += 1 : @position[2] -= 1
    when 'Down'
      direction == 'f' ? @position[2] -= 1 : @position[2] += 1
    end
  end

  def turn(direction)
    case @direction
    when 'N'
      @direction = direction == 'l' ? 'W' : 'E'
    when 'S'
      @direction = direction == 'l' ? 'E' : 'W'
    when 'E'
      @direction = direction == 'l' ? 'N' : 'S'
    when 'W'
      @direction = direction == 'l' ? 'S' : 'N'
    end
  end

  def rotate_angle(direction)
    puts "#{@direction} -------= #{direction}"
    @direction = direction == 'u' ? 'Up' : 'Down'
  end
end

# Example Usage
craft = GalacticSpaceCraft.new([0, 0, 0], 'N')
craft.process_commands(['f', 'r', 'u', 'b', 'l'])

puts "Final Position: #{craft.position}"
puts "Final Direction: #{craft.direction}"
