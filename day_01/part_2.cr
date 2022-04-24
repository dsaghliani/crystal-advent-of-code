require "./read_input"

def solve(input)
    windows = input[0...input.size - 2].map_with_index { |m, i| sum_sliding_window(input, i) }
    last, *windows = windows
    increased = 0

    windows.each do |m|
        if m > last
            increased += 1
        end

        last = m
    end

    increased
end

def sum_sliding_window(input, index)
    input[index...index + 3].sum
end

input = read_input "input.txt"
solution = solve input
puts solution