/** Connect Four
 *
 * Player 1 and 2 alternate turns. On each turn, a piece is dropped down a
 * column until a player gets four-in-a-row (horiz, vert, or diag) or until
 * board fills (tie)
 */

// var WIDTH = 7;
// var HEIGHT = 6;
// var currPlayer = 1; // active player: 1 or 2
// var board = []; // array of rows, each row is array of cells  (board[y][x])

const width = 7;
const height = 6;

let currPlayer = 1; // active player: 1 or 2
let isGameOver = false;
const board = []; // array of rows, each row is array of cells  (board[y][x])

/** makeBoard: create in-JS board structure:
 *    board = array of rows, each row is array of cells  (board[y][x])
 */

function makeBoard() {
    // TODO: set "board" to empty HEIGHT x WIDTH matrix array <--done
    for (let y = 0; y < height; y++) {
        let row = createBoardRow();
        board.push(row);
    }
}

function createBoardRow() {
    const boardRow = [];
    for (let x = 0; x < width; x++) {
        boardRow.push(null);
    }
    return boardRow;
}

/** makeHtmlBoard: make HTML table and row of column tops. */

function makeHtmlBoard() {
    const game = document.getElementById('game');

    // TODO: get "htmlBoard" variable from the item in HTML w/ID of "board" <--done
    const htmlBoard = document.getElementById('board');

    // TODO: add comment for this code  <--done
    // tr element created to represent top row;  addEventListener added to top row which
    //     with trigger when the row is clicked

    //changed var top to const top
    const top = document.createElement("tr");
    top.setAttribute("id", "column-top");
    top.classList.add("p1HoverColor");
    top.addEventListener("click", handleClick);


    // td element created to represent headCell and appended to top; each td will have id equal to its position of width
    //     with trigger when the row is clicked

    //changed var x to let, headCell to const 
    for (let x = 0; x < width; x++) {
        const headCell = document.createElement("td");
        headCell.setAttribute("id", x);
        top.append(headCell);
    }
    htmlBoard.append(top);

    // TODO: add comment for this code  <--done
    // td element created for each tr to create cell; each cell appenede to htmlBoard
    //     with trigger when the row is clicked

    //changed var x, y to let 
    for (let y = 0; y < height; y++) {
        const row = document.createElement("tr");
        for (let x = 0; x < width; x++) {
            const cell = document.createElement("td");
            cell.setAttribute("id", `${x}-${y}`);
            row.append(cell);
        }
        htmlBoard.append(row);
    }
}

/** findSpotForCol: given column x, return top empty y (null if filled) */

function findSpotForCol(x) {
    // TODO: write the real version of this, rather than always returning 0  <-- done
    for (let y = height - 1; y >= 0; y--) {
        if (board[y][x] === null) {
            return y;
        }
    }
    return null;
}

/** placeInTable: update DOM to place piece into HTML table of board */

function placeInTable(y, x) {
    // TODO: make a div and insert into correct table cell  <-- done

    const div = document.createElement("div");
    div.classList.add("piece");
    currPlayer === 1 ? div.classList.add("pieceColorP1") : div.classList.add("pieceColorP2");

    const td = document.getElementById(`${x}-${y}`);
    td.append(div);
}

/** endGame: announce game end */

function endGame(msg) {
    isGameOver = true;
    const top = document.getElementById('column-top');
    top.classList.remove("p1HoverColor");
    top.classList.remove("p2HoverColor");
    top.classList.add("gameOver");

    // TODO: pop up alert message  <-- done
    // replaced alert message with h2
    const game = document.getElementById('game');
    const results = document.createElement('h2');
    results.innerText = msg;
    game.after(results);
    const newBtn = document.createElement('button');
    newBtn.classList.add("newBtn");
    newBtn.innerText = "New Game";
    newBtn.addEventListener("click", newGame);
    results.after(newBtn);
}

function newGame() {
    currPlayer = 1; // active player: 1 or 2
    isGameOver = false;

    // re-initialize array
    for (let y = 0; y < height; y++) {
        for (let x = 0; x < width; x++) {
            board[y][x] = null;
        }
    }

    const allPieces = Array.from(document.getElementsByClassName('piece'));

    for (let piece of allPieces) {
        piece.remove();
    }

    const h2 = document.querySelector('h2');
    h2.remove();
    const newBtn = document.querySelector('.newBtn');
    newBtn.remove();

    const top = document.getElementById('column-top');
    top.classList.add("p1HoverColor");
    top.classList.remove("gameOver");
}

/** handleClick: handle click of column top to play piece */

function handleClick(evt) {
    if (isGameOver) {
        return;
    }

    // get x from ID of clicked cell
    //changed var x, y to let 
    let x = +evt.target.id;

    // get next spot in column (if none, ignore click)
    let y = findSpotForCol(x);
    if (y === null) {
        return;
    }

    // place piece in board and add to HTML table
    placeInTable(y, x);

    // TODO: add line to update in-memory board <-- done
    board[y][x] = currPlayer;

    // check for win
    if (checkForWin()) {
        return endGame(`Player ${currPlayer} won!`);
    }

    // check for tie
    // TODO: check if all cells in board are filled; if so call, call endGame  <-- done
    let tied = board.every(row => row.every(cell => cell === 1 || cell === 2))
    if (tied) {
        endGame(`Players tied!`)
    };

    // switch players
    // TODO: switch currPlayer 1 <-> 2  <-- done
    const top = document.getElementById('column-top');

    if (currPlayer === 1) {
        currPlayer = 2
        top.classList.remove("p1HoverColor");
        top.classList.add("p2HoverColor");
    }
    else {
        currPlayer = 1;
        top.classList.remove("p2HoverColor");
        top.classList.add("p1HoverColor");
    }
}

/** checkForWin: check board cell-by-cell for "does a win start here?" */

function checkForWin() {
    function _win(cells) {
        // Check four cells to see if they're all color of current player
        //  - cells: list of four (y, x) cells
        //  - returns true if all are legal coordinates & all match currPlayer

        return cells.every(
            ([y, x]) =>
                y >= 0 &&
                y < height &&
                x >= 0 &&
                x < width &&
                board[y][x] === currPlayer
        );
    }

    // TODO: read and understand this code. Add comments to help you.  <-- done

    // There are 4 ways to win: horizontally, vertically, diagonally right, diagnally left
    // The nexted loop creates an array for each possible way to win containing the values of each cell in it.
    // Within the loop, function _win is called to see if each cell in one of the possible type-of-win fields
    // contains the same currPlayer value and if so returns true 

    // changed y, x, horiz, vert, diagDR, diagDL from var to let
    for (let y = 0; y < height; y++) {
        for (let x = 0; x < width; x++) {
            let horiz = [[y, x], [y, x + 1], [y, x + 2], [y, x + 3]];
            let vert = [[y, x], [y + 1, x], [y + 2, x], [y + 3, x]];
            let diagDR = [[y, x], [y + 1, x + 1], [y + 2, x + 2], [y + 3, x + 3]];
            let diagDL = [[y, x], [y + 1, x - 1], [y + 2, x - 2], [y + 3, x - 3]];

            if (_win(horiz) || _win(vert) || _win(diagDR) || _win(diagDL)) {
                return true;
            }
        }
    }
}

makeBoard();
makeHtmlBoard();
