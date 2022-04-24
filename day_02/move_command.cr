enum Direction
    Forward
    Up
    Down
end

struct MoveCommand
    property direction : Direction
    property magnitude : Int32

    def initialize(@direction : Direction, @magnitude : Int32)
    end
end