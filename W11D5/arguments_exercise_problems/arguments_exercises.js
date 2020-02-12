// Write a sum function that takes any number of arguments:
// Solve it first using the arguments keyword, then rewrite your
// solution to use the ... rest operator.

//with arguments keyword

// const sum = function() {
//   let sum = 0;

//   for(let i = 0; i < arguments.length; i++){
//     sum += arguments[i]
//   };

//   return sum 
// };


// sum(1, 2, 3, 4) === 10;
// sum(1, 2, 3, 4, 5) === 15;

//with rest operator

// const sum = function(...args) {
//   let sum = 0;

//   for (let i = 0; i < args.length; i++) {
//     sum += args[i]
//   };

//   return sum
// };

// sum(1, 2, 3, 4) === 10;
// sum(1, 2, 3, 4, 5) === 15;

// Rewrite your myBind method so that it can take both bind-time arguments and 
// call-time arguments. With the arguments && ... operator

Function.prototype.myBind = function() { 
  const fn = this;
  const args = Array.from(arguments);
  // console.log(args);

  return function () {
    const callargs = Array.from(arguments);
    return fn.apply(args[0], args.slice(1).concat(callargs));
  };
};

Function.prototype.myBind2 = function(context,...args){

}



// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }

// class Dog {
//   constructor(name) {
//     this.name = name;
//   }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");

// markov.says.myBind(pavlov, "meow", "Kush")();

// markov.says.myBind(pavlov)("meow", "a tree");

// markov.says.myBind(pavlov, "meow")("Markov");

// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");


function curriedSum(numArgs){
  const nums = [];
  const max = numArgs;
  
  function _curriedSum (num){

    nums.push(num);
    let total = 0;
    
    if (nums.length === max){
      for (let i = 0; i  < nums.length; i++) {
        total += nums[i];
      };
      return total;
    } else {
      return _curriedSum;
    };
  };

  return _curriedSum;

};

// const sum = curriedSum(4);//should return func
// console.log(sum(5));
// console.log(sum(30));
// console.log(sum(20));
// console.log(sum(1));
// console.log(sum(5)(30)(20)(1));

Function.prototype.curry = function(numArgs) {
  const args = [];
  const context = this;

  function _curry(arg){
    args.push(arg)

    if (nums.length === numArgs) {
      return context.apply(null, args);
      //return context()
    } else {
      return _curry;
    };
  };
  
  return _curry;
};


///////////////


Function.prototype.curry = function (numArgs) {
  const argees = [];
  const context = this;

  function _curry(...args) {

    for (let i=0; i < args.length; i++){
      argees.push(args[i])
    }

    if (nums.length === numArgs) {
      return context.apply(context, argees);
    } else {
      return _curry;
    };
  };

  return _curry;
};

