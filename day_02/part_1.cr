require "./move_command"
require "./read_input"

def solve(commands)
    x = y = 0

    commands.each do |cmd| 
        case cmd.direction
        when Direction::Forward
            x += cmd.magnitude
        when Direction::Down
            y += cmd.magnitude
        when Direction::Up
            y -= cmd.magnitude
        end
    end

    {x: x, y: y}
end

input = read_input("input.txt")
solution = solve(input)
puts solution[:x] * solution[:y]