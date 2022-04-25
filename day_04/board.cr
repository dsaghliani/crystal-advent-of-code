WIDTH = 5

class Board
  def initialize(@numbers : Array(Int32))
    @marked = [] of Int32
    @unmarked = @numbers.dup()
  end

  # Returns true if the board won; otherwise, false.
  def mark(number : Int32)
    removed = @unmarked.delete(number)

    if removed
      @marked << number
    end

    won?()
  end

  def sum_unmarked()
    @unmarked.sum()
  end

  private def won?()
    marked = ->(num : Int32) { @marked.includes?(num) }

    # Check by row.
    @numbers.each_slice(WIDTH) do |row|
      if row.all?(&marked)
        return true
      end
    end

    # Check by column.
    WIDTH.times do |x|
      column = [] of Int32

      WIDTH.times do |y|
        index = y * WIDTH + x
        column << @numbers[index]
      end

      if column.all?(&marked)
        return true
      end
    end

    false
  end
end

def create_boards(input : Array(Int32))
  boards = [] of Board

  input.each_slice(WIDTH * WIDTH) do |board_data|
    boards << Board.new(board_data)
  end

  boards
end

