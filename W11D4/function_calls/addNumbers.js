const readline = require('readline');

const reader = readline.createInterface({
    // 1. output the prompt to the standard output (console)
    // 2. read input from the standard input (again, console)

    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft > 0){
        reader.question("Enter the next number:", function (number) {
            // console.log( numsLeft);
            // console.log("Enter the block mthd");
          let num = parseInt(number);
          sum += num;
          console.log(`sum: ${sum} `);
          addNumbers(sum, numsLeft - 1, completionCallback);
        });
    } 

    if (numsLeft === 0) {
        completionCallback(sum);
    }
  }
  
  addNumbers(0, 3, function (sum){
    console.log(`Total Sum: ${sum}`);
    reader.close();
  });
