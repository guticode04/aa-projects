function range(start,end) {
  //base case is when start and end are equal
  if(start === end){
    return [];
  }

  let result = range(start, end - 1);
  result.push(end - 1);
  return result;
}

// console.log(range(1,3)); // => [1,2]

function sumRec(nums) {
  if(nums.length === 0){
    return 0;
  }

  let head = nums[0];
  let tail = nums.slice(1);

  return head + sumRec(tail);

}

// console.log(sumRec([1,2,3,4,5,6,7])); // => 28 

function sumIter(nums) {
  let sum = 0;
  nums.forEach(function (num) {
    sum += num;
  })
  return sum;
}

// console.log(sumIter([1,2,3,4,5,6,7])); // => 28 

//version 1
function exponent(base, exp) {
  if(exp === 0){
    return 1;
  }

  return base * exponent(base,exp - 1);

}

//version 2
function exponent2(base, exp) {
  if(exp === 0){
    return 1;
  }
  
  if(exp % 2 === 0){
    let power = exponent2(base,(exp/2))
    return power * power;
  } else {
    let power = exponent2(base,((exp - 1)/2));
    return base * power * power
  }
}

// console.log(exponent2(2,6));

function fibonacci(n) {
  if(n < 3){
    return [0,1].slice(0,n);
  }

  // this returns an array when it hits the base case
  let fibs = fibonacci(n - 1);
  // after it returns from its recursive call it will continue on to this
  let next_fib = fibs[fibs.length - 1] + fibs[fibs.length - 2];
  // line where it will you have to push the next num into the seq
  fibs.push(next_fib);
  // then it will finally come here where it can return from its other
  // recursive call
  return fibs;
}

// console.log(fibonacci(5));


function fibonacciIter(n) {
  let seq = [0,1];

  if(n < 3){
    return seq.slice(0,n);
  }

  while(seq.length < n){
    let next_fib = seq[seq.length - 1] + seq[seq.length -2];
    seq.push(next_fib);
  }

  return seq;

}

// console.log(fibonacciIter(6));

function deepDup(arr) {
  //we want to return the the element of the array. so if the element of the
  //array isnt an array itself then we know that we have hit the base
  //case and we need to duplicate the item/ele
  if(!(arr instanceof Array)){
    return arr;
  }

  return arr.map(function (ele) {
    return deepDup(ele);
  });
  
}

// const array = [[2], 3];
// const dupedArray = deepDup(array);
// console.log(`deepDup original = ${JSON.stringify(array)}`);

// dupedArray[0].push(4);

// console.log(`deepDup original = ${JSON.stringify(array)} (should not be mutated)`);
// console.log(`deepDup duped = ${JSON.stringify(dupedArray)} (should be mutated)`);


function bSearch(arr, target) {
  // only once we have looked through the entire array can we say that we 
  // didn't find what we were looking for.
  if(arr.length === 0){
    return -1;
  }

  // NB: The array coming in is already sorted. BinarySearch, that kind of
  // gives us a hint of how this should work. Binary, meaning two. So cut the
  // array in half and depending on that look either right or left

  const mid = Math.floor(arr.length / 2);
  const left = arr.slice(0,mid);
  // for the right half we can do just arr.slice(mid). Its that same thing
  // as arr.slice(mid, arr.length). Also we don't really need the middle
  // ele of the array because we check it against the target everytime
  // const right = arr.slice(mid, arr.length)
  const right = arr.slice(mid + 1);

  if(target === arr[mid]){
    return mid;
  } else if(target < arr[mid]) {
    return bSearch(left, target);
  } else {
    const  result_idx = bSearch(right, target);
    // adjust the index of the right side search
    return result_idx === -1 ? -1 : (mid + 1) + result_idx;
  }
  
}

function merge(left, right) {
  // This function is the one merging the sorted arrays
  let merged = [];

  // we need to go through every element in the arrays and figure out 
  // in which order to merge them
  while(left.length > 0 && right.length > 0){
    // check to see which element needs to go next
    let nextEle = left[0] < right[0] ? left.shift() : right.shift();
    merged.push(nextEle);
  }

  // merged all three arrays
  return merged.concat(left, right);
}

//Merge Sort
function mergeSort(arr) {
  // We need our base case dont forget
  if(arr.length < 2){
    return arr;
  } else {

    let mid = Math.floor(arr.length / 2);
    let left = arr.slice(0,mid);
    let right = arr.slice(mid);

    let sorted_left = mergeSort(left);
    let sorted_right = mergeSort(right);

    return merge(sorted_left, sorted_right);
    
  }
  
}


console.log(`mergeSort([4, 5, 2, 3, 1]) = ${mergeSort([4, 5, 2, 3, 1])}`);

// Subsets: come back to this because most likely wont be on the test.





