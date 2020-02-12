class Clock { 
  constructor (){
    // 1. Create a Date object.
    this.date = new Date();
    // console.log(this.date);
    // 2. Store the hours, minutes, and seconds.
    this.hour = this.date.getHours();
    this.minutes = this.date.getMinutes();
    this.seconds = this.date.getSeconds();
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this), 1000);
    // this._tick().bind(this);
  }

  printTime(){
    // console.log("Here");
    console.log(this.hour + ":" + this.minutes + ":" + this.seconds);
  }

    _tick() {
        this.incrementSeconds();
        this.printTime();
    }

    incrementSeconds() {
        this.seconds += 1;
        if (this.seconds === 60){
            this.seconds = 0;
            this.incrementMinutes();
        }
        return this.seconds;
    }

    incrementMinutes() {
        this.minutes += 1;
        if (this.minutes === 60) {
            this.minutes = 0;
            this.incrementHours();
        }
        return this.minutes;
    }

    incrementHours() {
        this.hour += 1;
        if (this.hour === 24) {
            this.hour = 0;
        }
        return this.hour;
    }
}

const clock = new Clock();

