class Game extends React.Component {
  constructor() {
    super()
    this.state = {
      board: [],
      gameID: '',
      difficulty: '',
      gameStatus: ''
    }
  }

  componentWillMount(){
    this.setState({
      board: this.props.rubyBoard,
      gameID: this.props.gameID,
      difficulty: this.props.difficulty,
      gameStatus: this.props.gameStatus
    })
  }

  updateBoard(new_board) {
    this.setState({board: new_board})
  }

  updateGameStatus(new_status){
    this.setState({gameStatus: new_status})
  }

  render(){
    var parent = this
    var parsedRow = function(row){
      return row.map(square => {
        return(<Square parent={parent} key={square.id} objKey = {square.id} data={square.content} />)
      })
    }

    var row1Return = parsedRow(this.state.board.slice(0, 5))
    var row2Return = parsedRow(this.state.board.slice(5, 10))
    var row3Return = parsedRow(this.state.board.slice(10, 15))
    var row4Return = parsedRow(this.state.board.slice(15, 20))
    var row5Return = parsedRow(this.state.board.slice(20, 25))
    var gameStatus = this.state.gameStatus
    var gameDifficulty = this.state.difficulty
    return(

      <div className="board">
        Game Status: {gameStatus}<br/>
        Game Difficulty: {gameDifficulty}
        <div className="row">
          {row1Return}
        </div>
        <div className="row">
          {row2Return}
        </div>
        <div className="row">
          {row3Return}
        </div>
        <div className="row">
          {row4Return}
        </div>
        <div className="row">
          {row5Return}
        </div>
      </div>
    )
  }
}
