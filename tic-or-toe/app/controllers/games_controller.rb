class GamesController < ApplicationController
  def index
    @game = Game.new unless @game
    # @board = GamesHelper.process_board(@game.game_board)
  end

  def show
    @game = Game.find(params[:id])
    @board = GamesHelper.process_board(@game.game_board)
  end

  def create
    @game = Game.new
    @game.user_id = session[:user_id]
    @game.save
    redirect_to @game
  end

  def edit
    p "GOT HERE MUFACKA!!"
    @game = Game.find(params[:id])
    p @game
    if request.xhr?
        @game.game_board = GamesHelper.plot(params[:player_move], @game.game_board)
        if check_board('x', @game.game_board)
          p "player wins!!!!"
          @game.game_won = true
        end
        @game.game_board = num_away(1, @game.game_board)
        if check_board('o', @game.game_board)
          p "computer wins!!!!"
          game_status = "lost"
        end
        @game.save
        @board = GamesHelper.process_board(@game.game_board)
        render json: {
          board: @board
        }
    end
    @board = GamesHelper.process_board(@game.game_board)
  end

end
