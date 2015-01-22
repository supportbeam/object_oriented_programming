class Rover
  attr_accessor :x, :y, :direction
	def initialize(x=0, y=0, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def read_instruction(instruction)
    instruction.split("").each do |i|
      if i == 'M'
        move
      elsif i == "L" || i == "R"
        turn(i)
      else
        "That is not a valid input."
      end
    end
  end

  def move
    case @direction
    when "N"
      then @y += 1
    when "E"
      then @x += 1
    when "S"
      then @y -= 1
    when "W"
      then @x -= 1
    end
  end

  def turn(rotate)
    if (@direction == "N" && rotate == "L") || (@direction == "S" && rotate == "R")
      @direction = 'W'
    elsif (@direction == "E" && rotate == "L") || (@direction == "W" && rotate == "R")
      @direction = "N"
    elsif (@direction == "W" && rotate == "L") || (@direction == "E" && rotate == "R")
      @direction = "S"
    elsif (@direction == "S" && rotate == "L") || (@direction == "N" && rotate == "R")
      @direction = "E"
    else 
      "There"
    end
  end

end

puts "Upper-right coordinates of the plateau:"
plateau_size = gets.chomp

puts "Please provide the initial start position:"
start_position = gets.chomp

puts "Please provide navigation instructions:"
navigation = gets.chomp




r1 = Rover.new(1, 2, 'N')
r1.read_instruction("LMLMLMLMM")
puts r1.x
puts r1.y
puts r1.direction

r2 = Rover.new(3, 3, 'E')
r2.read_instruction("MMRMMRMRRM")
puts r2.x
puts r2.y
puts r2.direction



# INPUT AND OUTPUT

# Test Input:
# 5 5                  > Our first line is our plateau size. 
# 1 2 N                > Lines 2 and 3 are paired, with the first being our initial start position and header,
# LMLMLMLMM            > and the second line being a series of move and turn instructions.
# 3 3 E                > Another 2-line pair, 1 pair per rover.
# MMRMMRMRRM

# Expected Output:
# 1 3 N                > When rover bot is done doing its instructions, output its current position
# 5 1 E                > The first line is the first rover, the second line is the next rover
