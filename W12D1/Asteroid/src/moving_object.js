function MovingObject (optionsHash) {
  //can also key into hash with '.' => optionsHash.pos
  this.pos = optionsHash['pos'];
  this.vel = optionsHash['vel'];
  this.radius = optionsHash['radius'];
  this.color = optionsHash['color'];
}

let test = new MovingObject({pos: [1,2], vel: [3,4], radius: 10, color: `red`})

MovingObject.prototype.draw = function draw (ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(this.pos[0],this.pos[1],this.radius, 0, 2 * Math.PI, true);
  ctx.fill();
  // ctx.getContext('2d')
}


MovingObject.prototype.move = function move() {
  this.pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];
}
// mo.move();
// const mo = new MovingObject({
//   pos: [30, 30],
//   vel: [10, 10],
//   radius: 5,
//   color: "#00FF00"
// });

module.exports = MovingObject;