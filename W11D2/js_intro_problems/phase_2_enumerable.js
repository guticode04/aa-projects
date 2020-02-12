// JavaScript enumerates over arrays differently than Ruby; rather 
// than taking a block, they take a callback function,
// which is invoked for each element of the array.

Array.prototype.myEach = function (callback){
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
}

// let cb = function (ele) {
//   console.log(ele);
// }
// arr.myEach(cb);

Array.prototype.myMap = function (callback) {
  mapped = [];
  
  this.myEach(function (ele){
    mapped.push(callback(ele));
  })
  
  return mapped;
}

// let cb = function (num) {
  //   return num * num;
  // }
  // console.log(arr.myMap(cb));
  
  Array.prototype.myReduce = function (callback,initValue) {
    // make a copy of the array calling myReduce
    // don't think that this has anything with binding the 
    //values/the array but it might because it we have to pass
    //them to the call back
    let arr = this;

    if (initValue === undefined){
      initValue = arr[0];
      //take off the first element because we don't need to add it twice
      arr = arr.slice(1);
    }

    //set the sum or the accumulator equal the initValue
    let sum = initValue;

    //myEach takes a callback. inside that callback your going to
    // set the sum/acc to whatever the callback being passed into 
    // myReduce gives back. There's a lot of passing around in 
    // JavaScript
    arr.myEach(function (ele) {
      // your call back should take in two args because you need
      // to add them up in the callback being passed in
      sum = callback(sum,ele);
    })

    return sum;

  }
  
  
  let arr = [1, 2, 3, 4];

  //so when your calling myReduce you're passing in the callback/proc
  // thats going to be doing the work.
  console.log(arr.myReduce(function (total, item) {
    return total + item;
  },5));

  /* **********************************************
  * DONT FORGET THAT THE CALL BACK BEING PASSED IN
  * IS THE ONE THAT IS DOING ALL THE WORK. CALLBACKS
  * ARE LIKE PROCS/BLOCKS IN RUBY. THEY ARE THE ONES
  * MANIPULATING THE DATA 
  * *********************************************** */