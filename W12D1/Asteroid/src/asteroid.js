const util = require('util');
const MovinObject = require('moving_object');
Util.inherits(Asteroid, MovingObject);

const DEFAULTS = {
  COLOR: 'red',
  RADIUS: 10
}

function Asteroid(options) {
  options.pos = optionsHash['pos']; 
  options.vel = optionsHash['vel']; 
  options.radius = DEFAULTS.RADIUS;
  options.color = DEFAULTS.COLOR; 
}
