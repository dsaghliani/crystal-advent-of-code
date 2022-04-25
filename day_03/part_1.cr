require "./read_input"


def solve(input)
  gamma = [] of Int32
  epsilon = [] of Int32
  precision = input.first.size

  precision.times do |i|
    counter = 0

    input.each do |num|
      bit = num[i]

      case bit
      when '0'
        counter -= 1
      when '1'
        counter += 1
      end
    end

    if counter > 0
      gamma << 1
      epsilon << 0
    else
      gamma << 0
      epsilon << 1
    end
  end

  gamma = gamma.join().to_i(base: 2)
  epsilon = epsilon.join().to_i(base: 2)

  gamma * epsilon
end

input = read_input("input.txt")
solution = solve(input)
puts solution