require "./read_input"
require "./board"

def solve(numbers : Array(Int32), boards_data : Array(Int32))
  boards = create_boards(boards_data)
  won_boards = [] of Board

  numbers.each do |number|
    leftover_boards = boards - won_boards

    leftover_boards.each do |board|
      won = board.mark(number)
      if won
        won_boards << board

        if leftover_boards.size() == 1
          sum = board.sum_unmarked()
          return sum * number
        end
      end
    end
  end

  raise "Couldn't find a winner."
end

numbers, boards_data = read_input("input.txt")
solution = solve(numbers, boards_data)
puts solution