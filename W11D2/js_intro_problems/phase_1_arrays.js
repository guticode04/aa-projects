//My practice
Array.prototype.myUniq = function () {
  uniq = [];
  this.forEach( function(ele) {
    if(!uniq.includes(ele)) {
      uniq.push(ele);
    }
  })
  return uniq;
}
// console.log([1, 2, 2, 3, 3, 3].myUniq());

Array.prototype.twoSums = function () {
  zero_sums = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        zero_sums.push([i,j]);
      }
    }
  }
  return zero_sums;
}

// console.log([1,-1,2,3,-2,0,0].twoSums()); // => [[0,1],[2,4],[5,6]]

Array.prototype.myTranspose = function () {
  //Array.from takes in an arguement that basically says make an 
  //array from what I give you. What we typed out might be redundant
  //but it worked
  transposed = Array.from(new Array(this[0].length),
   () => new Array ());
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      transposed[i].push(this[j][i]);
    }
  }
  return transposed;
}
const arr = [[1,2,3],[4,5,6],[7,8,9]];
console.log(arr.myTranspose()); // => [[1,4,7],[2,5,8],[3,6,9]]