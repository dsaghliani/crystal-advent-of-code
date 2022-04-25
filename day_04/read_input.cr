TO_I32 = ->(num : String) { num.to_i32() }

def read_input(file_path : String)
  lines = File.read_lines(file_path).select { |line| !line.empty?() }

  numbers = lines.shift().split(',').map(&TO_I32)
  boards_data = [] of Int32
  
  lines.each() do |row|
    boards_data += row.split().map(&TO_I32)
  end

  {numbers, boards_data}
end