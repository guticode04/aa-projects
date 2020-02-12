// Function.prototype.inherits = function(parentObj){
//   function Surrogate () {};
//   Surrogate.prototype = parentObj.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// }

Function.prototype.inherits = function (parentObj) {
  this.prototype = Object.create(parentObj.prototype);
  this.prototype.constructor = this
}

function MovingObject() { };

function Ship() { };
Ship.inherits(MovingObject);

function Asteroid() { };
Asteroid.inherits(MovingObject);

const asty = new Asteroid();
const shipzz = new Ship();

