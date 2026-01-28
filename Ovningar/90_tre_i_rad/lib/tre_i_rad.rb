def parse(path)
  if !File.exist?(path)
    return "Spelplanen finns inte."
  end

  content = File.read(path)
  lines = content.split("\n")
  result = []
  i = 0
  while i < lines.length
    if lines[i] != ""
      result = result + [lines[i].split(" ")]
    end
    i += 1
  end

  return result
end

def valid_moves(board)
  result = []

  y = 0
  while y < board.length
    x = 0
    while x < board[y].length
      if board[y][x] == "-"
        coord = {
          "x" => x,
          "y" => board.length - 1 - y
        }
        result = result + [coord]
      end
      x += 1
    end
    y += 1
  end

  return result
end
