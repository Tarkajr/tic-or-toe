class Game extends React.Component {
  constructor() {
    super()
  }

  // updateBoard(square) {
  //   var board = this.state.board
  //   // find the spot in the array, and update it with the square
  //   this.setState(board: [newArray])
  // }

  render(){
    const squares = this.props.rubyBoard.map(square => {
      return(<Square key={square.id} data={square.content} />)
    })
    return(
      <div className="row">
        {squares}
      </div>
    )
  }
}


// {board.map(sq => <Square updateBoard={this.updateBoard} marked={sq} />)}
