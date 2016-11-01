class Game extends React.Component {


  render(){

      return(
        <section className="container">
        <div id="board">
    <table>
    <tbody>
      <tr id="row1">
        <td id="zero-zero" className="square"></td>
        <td id="zero-one" className="square"></td>
        <td id="zero-two" className="square"></td>
      </tr>
      <tr id="row2">
        <td id="one-zero" className="square"></td>
        <td id="one-one" className="square"></td>
        <td id="one-two" className="square"></td>
      </tr>
      <tr id="row3">
        <td id="two-zero" className="square"></td>
        <td id="two-one" className="square"></td>
        <td id="two-two" className="square"></td>
      </tr>
      </tbody>
    </table>
  </div>
        </section>
      )
    }




}
