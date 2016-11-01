game_board = [[" "," "," "," "," "],
			        [" "," "," "," "," "],
              [" "," "," "," "," "],
              [" "," "," "," "," "],
			        [" "," "," "," "," "]]

def player_turn(game_board)
	puts "enter your turn:"
	player_move = gets.chomp
	plot(player_move, game_board)
end

def plot(player_move, game_board)
	y = player_move[0].to_i
	x = player_move[1].to_i
	game_board[y][x] = "x"
  return game_board
end

def display_board(board)
	board.each do |row|
		p row
	end
  p "**warning!" if empty_tiles(board).length.even?
end

def check_board(letter, game_board)
  winner = false
  game_board.each do |row|
    winner = true if (row.select{|char| char == letter}).length == row.length
  end
  game_board.transpose.each do |column|
    winner = true if (column.select{|char| char == letter}).length == column.length
  end
  diagonal_one = [game_board[0][0], game_board[1][1], game_board[2][2], game_board[3][3], game_board[4][4]]
  diagonal_two = [game_board[4][0], game_board[3][1], game_board[2][2], game_board[1][3], game_board[0][4]]

  winner = true if (diagonal_one.select{|char| char == letter}).length == diagonal_one.length
  winner = true if (diagonal_two.select{|char| char == letter}).length == diagonal_two.length
  winner
end

def board_is_same(new_board, original_board)
  new_board == original_board
end

def empty_tiles(game_board)
  empty_tiles = []
  i = 0
  while i < game_board.length
    j = 0
    while j < game_board[i].length
      empty_tiles << (i.to_s + j.to_s) if game_board[i][j] == " "
      j += 1
    end
    i += 1
  end
  empty_tiles
end

def num_away_from_winning(num, game_board)
  p "checking #{num} for computer win"
  item_plugged = false
  diagonal_one = [game_board[0][0], game_board[1][1], game_board[2][2], game_board[3][3], game_board[4][4]]
  diagonal_two = [game_board[4][0], game_board[3][1], game_board[2][2], game_board[1][3], game_board[0][4]]

  if (diagonal_one.select{|char| char == 'o'}).length == diagonal_one.length - num && !item_plugged
    diagonal_one.map! do |item|
      if item == " " && item_plugged == false
        item_plugged = true
        item = "o"
      else
        item
      end
    end
    game_board[0][0] = diagonal_one[0]
    game_board[1][1] = diagonal_one[1]
    game_board[2][2] = diagonal_one[2]
    game_board[3][3] = diagonal_one[3]
    game_board[4][4] = diagonal_one[4]
  end

  if (diagonal_two.select{|char| char == 'o'}).length == diagonal_two.length - num && !item_plugged
    diagonal_two.map! do |item|
      if item == " " && item_plugged == false
        item_plugged = true
        item = "o"
      else
        item
      end
    end
    game_board[4][0] = diagonal_two[0]
    game_board[3][1] = diagonal_two[1]
    game_board[2][2] = diagonal_two[2]
    game_board[1][3] = diagonal_two[3]
    game_board[0][4] = diagonal_two[4]
  end

  game_board.each do |row|
    if (row.select{|char| char == 'o'}).length == row.length - num && !item_plugged
      row.map! do |item|
        if item == " " && item_plugged == false
          item_plugged = true
          item = "o"
        else
          item
        end
      end
    end
  end

  game_board = game_board.transpose
  game_board.each do |row|
    if (row.select{|char| char == 'o'}).length == row.length - num && !item_plugged
      row.map! do |item|
        if item == " " && item_plugged == false
          item_plugged = true
          item = "o"
        else
          item
        end
      end
    end
  end
  game_board = game_board.transpose
  game_board
end

def num_away(num, game_board)
  p "checking #{num} for player win"

  item_plugged = false
  diagonal_one = [game_board[0][0], game_board[1][1], game_board[2][2], game_board[3][3], game_board[4][4]]
  diagonal_two = [game_board[4][0], game_board[3][1], game_board[2][2], game_board[1][3], game_board[0][4]]

  win_board = num_away_from_winning(1, game_board)
  if !board_is_same(win_board, game_board)
    item_plugged = true
    game_board = win_board
  end
  if game_board[2][2] == " " && !item_plugged
    item_plugged = true
    game_board[2][2] = "o"
  end

  if (diagonal_one.select{|char| char == 'x'}).length == diagonal_one.length - num && !item_plugged
    diagonal_one.map! do |item|
      if item == " " && item_plugged == false
        item_plugged = true
        item = "o"
      else
        item
      end
    end
    game_board[0][0] = diagonal_one[0]
    game_board[1][1] = diagonal_one[1]
    game_board[2][2] = diagonal_one[2]
    game_board[3][3] = diagonal_one[3]
    game_board[4][4] = diagonal_one[4]
  end

  if (diagonal_two.select{|char| char == 'x'}).length == diagonal_two.length - num && !item_plugged
    diagonal_two.map! do |item|
      if item == " " && item_plugged == false
        item_plugged = true
        item = "o"
      else
        item
      end
    end
    game_board[4][0] = diagonal_two[0]
    game_board[3][1] = diagonal_two[1]
    game_board[2][2] = diagonal_two[2]
    game_board[1][3] = diagonal_two[3]
    game_board[0][4] = diagonal_two[4]
  end

  game_board.each do |row|
    if (row.select{|char| char == 'x'}).length == row.length - num && !item_plugged
      row.map! do |item|
        if item == " " && item_plugged == false
          item_plugged = true
          item = "o"
        else
          item
        end
      end
    end
  end

  game_board = game_board.transpose

  game_board.each do |row|
    if (row.select{|char| char == 'x'}).length == row.length - num && !item_plugged
      row.map! do |item|
        if item == " " && item_plugged == false
          item_plugged = true
          item = "o"
        else
          item
        end
      end
    end
  end
  game_board = game_board.transpose

  if num < 5 && !item_plugged
    game_board=num_away((num+1), game_board)
  end
  game_board
end

def random_move(game_board)
  random_move = empty_tiles(game_board).sample
  y = random_move[0].to_i
	x = random_move[1].to_i
	game_board[y][x] = "o"
  game_board
end


game_status = 'ongoing'

while game_status == 'ongoing'
  player_turn(game_board)
  if check_board('x', game_board)
    p "player wins!!!!"
    game_status = "won"
  end
  game_board = num_away(1, game_board)
  if check_board('o', game_board)
    p "computer wins!!!!"
    game_status = "lost"
  end
  display_board(game_board)
end

# game_board = random_move(game_board)
# display_board(game_board)
# game_board = random_move(game_board)
# display_board(game_board)
# game_board = random_move(game_board)
# display_board(game_board)
# game_board = random_move(game_board)
# display_board(game_board)
# game_board = random_move(game_board)
# display_board(game_board)
# game_board = random_move(game_board)
# display_board(game_board)
# game_board = random_move(game_board)
# display_board(game_board)
