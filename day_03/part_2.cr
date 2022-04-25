require "./read_input"

OXYGEN_COMPARISON = ->(ones : Int32, zeros : Int32) { ones >= zeros }
CO2_COMPARISON = ->(ones : Int32, zeros : Int32) { ones < zeros }

def solve(input : Array(String))
  oxygen_rating = find_rating(input, &OXYGEN_COMPARISON)
  co2_rating = find_rating(input, &CO2_COMPARISON)
  oxygen_rating * co2_rating
end

private def find_rating(
  input : Array(String),
  &comparison_function : Int32, Int32 -> Bool
)
  # The below assumes all inputs are of the same length.
  precision = input.first.size
  filtered_input = input
  i = 0

  until filtered_input.size == 1 || i >= precision
    zeros = [] of String
    ones = [] of String

    filtered_input.each do |num|
      case num[i]
      when '0'
        zeros << num
      when '1'
        ones << num
      end
    end
    
    keep_ones = yield ones.size, zeros.size
    filtered_input = keep_ones ? ones : zeros
    i += 1
  end

  unless filtered_input.size == 1
    raise "Failed to find the rating."
  end

  filtered_input.first.to_i(base: 2)
end

input = read_input("input.txt")
solution = solve(input)
puts solution