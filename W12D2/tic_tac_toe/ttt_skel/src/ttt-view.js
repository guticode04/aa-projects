class View {
  constructor(game, $el) {
    debugger
    this.game = game
    this.$el = $el
    this.setupBoard()
  }

  bindEvents() {
    debugger
    const that = this
    $('ul').on("click", "li", function (e) {
      const $square = $(e.currentTarget);
      // $($target).removeClass("unclicked");
      console.log(that)
      that.makeMove($square)
    })
  }

  makeMove($square) {
    const pos = $square.data("pos");
    if(!this.game.board.isEmptyPos(pos)){
      alert("Invalid move try again");
    }
    const currentPlayer = this.game.currentPlayer;
    $square.html(currentPlayer);
    $($square).addClass("mousedown");
    this.game.playMove(pos)
    $square.addClass(currentPlayer)
    if (this.game.isOver()) {
      
    }
  }

  setupBoard() {
    debugger;
    const $ul = $("<ul>")
    this.$el.append($ul)
    let col = 0, row = 0;
    for (let i = 0; i < 9; i++) {
      const $li = $('<li>')
      $ul.append($li)
      $li.data("pos", [row, col])
      col += 1
      if(col > 2){
        col = 0;
        row += 1;
      }
    }
  }
}

module.exports = View;
