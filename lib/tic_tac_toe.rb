class TicTacToe
    attr_accessor :board, :turn_count
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
    def initialize
        @board = [" ", " ", " ", 
                    " ", " ", " ",
                     " ", " ", " ",]
    end
    def display_board
        print [[" #{@board[0]} | #{@board[1]} | #{@board[2]} "],
                "-----------",
                [" #{@board[3]} | #{@board[4]} | #{@board[5]} "],
                "-----------",
                [" #{@board[6]} | #{@board[7]} | #{@board[8]} "],]
    end
    def input_to_index(str)
        str.to_i - 1
    end
    def move(num, symbol)
        @board[num] = symbol
    end
    def position_taken?(space)
        @board[space] != " " ? true : false
    end
    def valid_move?(space)
        (space >= 0 && space <= 8) ? !position_taken?(space) : false
    end
    def turn_count
        turn_count_array = @board.filter do |b|
            b !=" "
        end
        @turn_count = turn_count_array.length
        @turn_count
    end
    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end
    def turn
        player_move = gets
        space = input_to_index(player_move)
        current_player
        if valid_move?(space)
            move(space, "#{current_player}")
            display_board
        else
            move = gets
        end
    end
end