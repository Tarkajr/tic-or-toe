class App extends React.Component {


  constructor(){
    super();
    this.state = {
      // game_board: game_board
    }
  }

  componentDidMount(){

  }



  render(){

      return(
        <section className="container">
        <div id="logo">Tic-or-Toe</div>
        <Game/>
        </section>
      )
    }







}
