def read_input(file_path)
    lines = File.read_lines file_path
    lines.map { |line| line.to_i32 }
end