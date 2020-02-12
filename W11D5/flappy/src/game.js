// const Level = require('./level.js');
import Level from './level';
import Bird from './bird';

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.restart();
  }

  animate(level, bird) {
    level.animate(this.ctx);
    bird.animate(this.ctx);
  };
 
  restart() {
    this.bird = new Bird(this.dimensions);
    this.level = new Level(this.dimensions);
    this.animate(this.level, this.bird);
  };
}
