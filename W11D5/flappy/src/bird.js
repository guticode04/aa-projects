export default class Bird {
  constructor(dimensions) {
    this.velocity = 0;
    this.dimensions = dimensions;
    this.startPos = { x: 240 , y: 320 }
  }
  
  drawBird(ctx) {
    ctx.fillStyle = "yellow";
    ctx.fillRect(this.startPos.x, this.startPos.y, 30, 40);
  }

  animate(ctx) {
    this.drawBird(ctx);
  }

};