class Square extends React.Component {
  viewMore(){
    var gameBoard = this.props.parent
    var route = "/games/"+gameBoard.props.gameID+'/edit'
    $.ajax({
      url: route,
      method: 'get',
      data: {
              player_move: this.props.objKey
            }
    }).done((response)=>{
      gameBoard.updateBoard(response.board)
    })
  }
  render(){
    return(
      <div className="red-text square col s2" onClick={this.viewMore.bind(this)}>
        {this.props.data}
      </div>
    )
  }

}
