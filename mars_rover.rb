class Rover
  attr_accessor :x, :y, :direction, :width, :height
	def initialize(x=0, y=0, direction, width, height)
    @x = x.to_i
    @y = y.to_i
    @direction = direction
    @width = width.to_i
    @height = height.to_i
  end

  def to_s
    "#{x} #{y} #{direction}"
  end

  # ARROWS = {
  #   "N" => "↑",
  #   "S" => "↓",
  #   "E" => "→",
  #   "W" => "←",
  # }
  # ARROWS = {
  #   "N" => "^",
  #   "S" => "v",
  #   "E" => ">",
  #   "W" => "<",
  # }

  # def print_plateau(step_num)
  #   puts "Step: #{step_num}"
  #   sep = (["---"] * width) # Create separators as long as the width
  #   sep = [""] + sep + [""]  # Extra empties for bars
  #   sep = sep.join("+")     # Create corners
  #   height.downto(0) do |row|     # Go down the height
  #     puts sep
  #     r = ["   "] * width # Create cells
  #     if row == y # If the rover is on this row
  #       r[x] = " #{ARROWS[direction]} " # Print the direction in the cell
  #     end
  #     r = [""] + r + [""] # Adding outer bars

  #     puts r.join("|") # Creating and printing columns
  #   end
  #   puts sep
  #   sleep 0.3 # Pauses in 0.3 seconds
  #   puts
  # end

  def read_instruction(instruction)
    instruction.each_char.with_index do |i, step_num|
      if i == 'M'
        move
      elsif i == "L" || i == "R"
        turn(i)
      else
        "That is not a valid input."
      end
      # print_plateau(step_num)
    end
    puts self
  end

  def keep_on_plateau!
    @x = 0        if @x < 0
    @y = 0        if @y < 0
    @x = @width   if @x > @width 
    @y = @height  if @y > @height 
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
    keep_on_plateau!
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
width, height = gets.chomp.split

loop do
  puts "Please provide the initial start position:"
  line = gets
  exit if line.nil? or line.chomp.empty?

  line.chomp!
  
  x, y, dir = line.split

  puts "Please provide navigation instructions:"
  navigation = gets.chomp

  r1 = Rover.new(x, y, dir, width, height)
  r1.read_instruction(navigation)
end

# r1 = Rover.new(1, 2, 'N')
# r1.read_instruction("LMLMLMLMM")
# puts r1.x
# puts r1.y
# puts r1.direction

# r2 = Rover.new(3, 3, 'E')
# r2.read_instruction("MMRMMRMRRM")
# puts r2.x
# puts r2.y
# puts r2.direction



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
