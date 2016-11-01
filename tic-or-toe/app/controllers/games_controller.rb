class GamesController < ApplicationController
  def index
    @board = [
      {id: "00", content: 'x'},
      {id: "01", content: ' '},
      {id: "02", content: 'o'},
      {id: "03", content: ' '},
      {id: "04", content: 'x'},
      {id: "10", content: 'x'},
      {id: "11", content: ' '},
      {id: "12", content: 'o'},
      {id: "13", content: ' '},
      {id: "14", content: 'x'}
      ]
  end
end
