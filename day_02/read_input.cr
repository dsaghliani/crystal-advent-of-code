require "./move_command"

def read_input(file_path)
    input = [] of MoveCommand
    lines = File.read_lines(file_path)

    lines.each do |line|
        direction, value = line.split()

        direction = convert_to_enum(direction)
        value = value.to_i32()
        
        input << MoveCommand.new(direction, value)
    end

    input
end

private def convert_to_enum(direction)
    case direction
    when "forward"
        Direction::Forward
    when "up"
        Direction::Up
    when "down"
        Direction::Down
    else
        raise "No Direction type for '#{direction}'."
    end
end