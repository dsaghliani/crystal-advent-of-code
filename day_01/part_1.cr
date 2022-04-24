require "./read_input"

def solve(measurements)
    increased = 0
    last_measurement, *measurements = measurements 

    measurements.each do |measurement|
        if measurement > last_measurement
            increased += 1
        end
        
        last_measurement = measurement
    end

    increased
end

input = read_input("input.txt")
solution = solve input
puts solution 