require "./move_command"
require "./read_input"

def solve(commands)
    x = y = aim = 0

    commands.each do |cmd|
        case cmd.direction
        when Direction::Forward
            x += cmd.magnitude
            y += aim * cmd.magnitude
        when Direction::Down
            aim += cmd.magnitude
        when Direction::Up
            aim -= cmd.magnitude
        end
    end

    {x: x, y: y}
end

input = read_input("input.txt")
solution = solve(input)
puts solution[:x] * solution[:y]