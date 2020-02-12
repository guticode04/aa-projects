// Bubble Sort

Array.prototype.bubbleSort = function () {
  let isSorted = false;

  while(!isSorted){
    isSorted = true;
    for (let i = 0; i < this.length; i++) {
      if(this[i] > this[i+1]){
        [this[i], this[i+1]] = [this[i+1],this[i]];
        isSorted = false;
      }
    }
  }
  return this;
}

console.log([5,4,3,2,1].bubbleSort());


String.prototype.subStrings = function () {
  subs = [];

  for (let start = 0; start < this.length; start++) {
    for (let end = start + 1; end <= this.length; end++) {
      subs.push(this.slice(start,end));
    }
  }

  return subs;
}

console.log('abc'.subStrings());