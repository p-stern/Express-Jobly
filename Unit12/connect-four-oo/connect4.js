/** Connect Four
 *
 * Player 1 and 2 alternate turns. On each turn, a piece is dropped down a
 * column until a player gets four-in-a-row (horiz, vert, or diag) or until
 * board fills (tie)
 */
class Player {
  constructor(COLOR) {
    this.COLOR = COLOR;
  }
}

class Game {
  constructor(HEIGHT, WIDTH) {
    this.HEIGHT = HEIGHT;
    this.WIDTH = WIDTH;
    this.board = []; // array of rows, each row is array of cells  (board[y][x])  
    this.isGameOver = false;
    this.makeHtmlStart();
  }

  /** makeBoard: create in-JS board structure:
 *   board = array of rows, each row is array of cells  (board[y][x])
 */
  makeBoard() {
    for (let y = 0; y < this.HEIGHT; y++) {
      this.board.push(Array.from({ length: this.WIDTH }));
    }
  }
  /** makeHtmlBoard: make HTML table and row of column tops. */

  makeHtmlStart() {
    const game = document.getElementById('game');
    const spanBtn = document.createElement('span');
    const startBtn = document.createElement('button');
    startBtn.classList.add("startBtn");
    startBtn.innerText = "Start Game!";
    startBtn.addEventListener("click", this.validate);
    spanBtn.append(startBtn);
    game.before(spanBtn);
  }

  validate() {
    const boardRows = document.querySelectorAll('tr');

    for (let row of boardRows) {
      row.remove();
    }

    const player1 = document.getElementById('player1');
    const player2 = document.getElementById('player2');

    if (!(CSS.supports('color', player1.value.trim()) && CSS.supports('color', player2.value.trim()))) {
      alert("Enter valid color");
    }
    else {
      player1Color.COLOR = player1.value.trim();
      player2Color.COLOR = player2.value.trim();

      game.newGame();
    }
  }

  newGame() {
    game.currPlayerColor = player1Color.COLOR; // active player: player1Color or player2Color
    game.isGameOver = false;

    // re-initialize array
    game.board = [];

    game.makeBoard();
    game.makeHtmlBoard();
  }

  makeHtmlBoard() {
    const board = document.getElementById('board');

    // make column tops (clickable area for adding a piece to that column)
    const top = document.createElement('tr');
    top.setAttribute('id', 'column-top');
    top.addEventListener('click', this.handleClick);

    for (let x = 0; x < this.WIDTH; x++) {
      const headCell = document.createElement('td');
      headCell.setAttribute('id', x);
      top.append(headCell);
    }

    board.append(top);

    // make main part of board
    for (let y = 0; y < this.HEIGHT; y++) {
      const row = document.createElement('tr');

      for (let x = 0; x < this.WIDTH; x++) {
        const cell = document.createElement('td');
        cell.setAttribute('id', `${y}-${x}`);
        row.append(cell);
      }

      board.append(row);
    }
  }

  /** handleClick: handle click of column top to play piece */
  handleClick(evt) {
    if (game.isGameOver) {
      return;
    }

    // get x from ID of clicked cell
    const x = +evt.target.id;

    // get next spot in column (if none, ignore click)
    const y = game.findSpotForCol(x);
    if (y === null) {
      return;
    }

    // place piece in board and add to HTML table
    game.currPlayerColor === player1Color.COLOR ? game.board[y][x] = player1Color.COLOR : game.board[y][x] = player2Color.COLOR;
    game.placeInTable(y, x);

    // check for win
    if (game.checkForWin()) {
      return game.endGame(`The ${game.currPlayerColor} player won!`);
    }

    // check for tie
    if (game.board.every(row => row.every(cell => cell))) {
      return game.endGame('Tie!');
    }

    // switch players
    game.currPlayerColor = game.currPlayerColor === player1Color.COLOR ? player2Color.COLOR : player1Color.COLOR;
  }

  /** findSpotForCol: given column x, return top empty y (null if filled) */
  findSpotForCol(x) {
    for (let y = this.HEIGHT - 1; y >= 0; y--) {
      if (!this.board[y][x]) {
        return y;
      }
    }
    return null;
  }

  /** placeInTable: update DOM to place piece into HTML table of board */

  placeInTable(y, x) {
    const piece = document.createElement('div');
    piece.classList.add('piece');
    piece.style.top = -50 * (y + 2);
    game.currPlayerColor === player1Color.COLOR ? piece.style.backgroundColor = player1Color.COLOR :
      piece.style.backgroundColor = player2Color.COLOR;
    const spot = document.getElementById(`${y}-${x}`);
    spot.append(piece);
  }

  /** checkForWin: check board cell-by-cell for "does a win start here?" */

  checkForWin() {
    for (let y = 0; y < this.HEIGHT; y++) {
      for (let x = 0; x < this.WIDTH; x++) {
        // get "check list" of 4 cells (starting here) for each of the different
        // ways to win
        const horiz = [[y, x], [y, x + 1], [y, x + 2], [y, x + 3]];
        const vert = [[y, x], [y + 1, x], [y + 2, x], [y + 3, x]];
        const diagDR = [[y, x], [y + 1, x + 1], [y + 2, x + 2], [y + 3, x + 3]];
        const diagDL = [[y, x], [y + 1, x - 1], [y + 2, x - 2], [y + 3, x - 3]];

        // find winner (only checking each win-possibility as needed)
        if (this._win(horiz) || this._win(vert) || this._win(diagDR) || this._win(diagDL)) {
          return true;
        }
      }
    }
  }

  _win(cells) {
    // Check four cells to see if they're all color of current player
    //  - cells: list of four (y, x) cells
    //  - returns true if all are legal coordinates & all match currPlayerColor

    return cells.every(
      ([y, x]) =>
        y >= 0 &&
        y < this.HEIGHT &&
        x >= 0 &&
        x < this.WIDTH &&
        this.board[y][x] === this.currPlayerColor
    );
  }

  /** endGame: announce game end */
  endGame(msg) {
    this.isGameOver = true;
    alert(msg);
  }
}

const player1Color = new Player(player1.value);
const player2Color = new Player(player2.value);
const game = new Game(6, 7);   // assuming constructor takes height, width