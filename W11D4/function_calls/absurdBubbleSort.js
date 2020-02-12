const readline = require('readline');
// Setting up the reader for input/output
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Prompt user to tell us whether el1 > el2; pass true back to the
// callback if true; else false.
function askIfGreaterThan(el1, el2, callback){
    reader.question(`Is ${el1} > ${el2} ?`, function (answer) {
        if (answer === "yes") {
            callback(true);
        } else {
            callback(false);
        }
    });
}

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    // Do an "async loop":
    // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
    //    know whether any swap was made.
    // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
    //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
    //    continue the inner loop. You'll want to increment i for the
    //    next call, and possibly switch madeAnySwaps if you did swap.

    if (i == arr.length - 1) {
        outerBubbleSortLoop(madeAnySwaps);
    } else {
        askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan) {
            if (isGreaterThan === true){
                [arr[i],arr[i+1]] = [arr[i+1],arr[i]];                
                madeAnySwaps = true;
            };
            innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
        });
    }

}

function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        // Begin an inner loop if you made any swaps. Otherwise, call
        // `sortCompletionCallback`.
        if (madeAnySwaps === true) {
            innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
        } else {
            sortCompletionCallback(arr);
        }
    }

    // Kick the first outer loop off, starting `madeAnySwaps` as true.
    outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function (arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
});


// function bubbleSort(arr){
//     isSorted = false;

//     while (!isSorted){
//         isSorted = true;
//         for (let i = 0; i < arr.length; i++) {
//             if(arr[i] > arr[i + 1]){
//                 [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
//                 isSorted = false;
//             } 
//         }
//     }
// }

// absurdBubbleSort([3, 2, 1], function (arr) {
//     console.log("Sorted array: " + JSON.stringify(arr));
//     reader.close();
// });


// askIfGreaterThan(23, 43, function (answer) {
//     console.log(answer + "!!");
//     reader.close();
// });
//  arr = [4,8,2,9];
// innerBubbleSortLoop(arr, 0, false, function (outerBubbleSortLoop) {
//     console.log("In outer bubble sort");
//     reader.close();
// });

