class Square extends React.Component {
  clickSquare(){
    var gameBoard = this.props.parent
    var route = "/games/"+gameBoard.props.gameID+'/edit'
    if (gameBoard.state.gameStatus == "ongoing"){
      if (this.props.data == " "){
        $.ajax({
          url: route,
          method: 'get',
          data: {
                  player_move: this.props.objKey
                }
        }).done((response)=>{
          gameBoard.updateBoard(response.board)
          gameBoard.updateGameStatus(response.game_status)
        })
      }
      else {
        alert('Please Click Empty Tile!')
      }
    }
    else {
      alert("Game Over!")
    }


  }
  render(){
    return(
      <div className="red-text square col s2" onClick={this.clickSquare.bind(this)}>
        {this.props.data}
      </div>
    )
  }

}
