def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
   WIN_COMBINATIONS.each do |t|
     win_index_1 = t[0]
     win_index_2 = t[1]
     win_index_3 = t[2]
     game_status_1 = board[win_index_1]
     game_status_2 = board[win_index_2]
     game_status_3 = board[win_index_3]
     if game_status_1 == "X" && game_status_2 == "X" && game_status_3 == "X"
       return t
     elsif game_status_1 == "O" && game_status_2 == "O" && game_status_3 == "O"
       return t
     else
       false
     end
   end
   false
 end

 def full? (board)
   board.all? {|index| index == "x" || index == "O"}
 end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over? (board)
  if won?(board) || draw?(board) || full(board)
    return true
  else
    return false
  end
end

def winner?(board)
  index = []
  index = won?(board)
  if index == false
    return nil 
  else
    if board[index[0]] == "x"
      return "x"
    else
      return "0"
    end
  end
end
