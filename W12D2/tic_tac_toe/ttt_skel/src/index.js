const View = require("./ttt-view")
const Game = require("../../node_solution/game")

$(() => {
    const $container = $(".ttt")
    const game = new Game
    const view = new View(game, $container)

    // $('ul').on("mouseenter", "li", function (e){
    //   const $target = $(e.currentTarget);
    //   // $($target).removeClass("unclicked");
    //   $($target).addClass("mousedown");
    // })

    // $('ul').on("mouseleave", "li", function (e) {
    //   const $target = $(e.currentTarget);
    //   // $($target).removeClass("unclicked");
    //   $($target).removeClass("mousedown");
    // })

    // $('ul').on("click", "li", function (e) {
    //   const $target = $(e.currentTarget);
    //   // $($target).removeClass("unclicked");
    //   $($target).addClass("mousedown");
      
    // })
    view.bindEvents();
  });
