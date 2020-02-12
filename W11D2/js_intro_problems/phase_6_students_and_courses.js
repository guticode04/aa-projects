function Student(f_name, l_name) {
  this.f_name = f_name;
  this.l_name = l_name;
  this.courses = [];
}

Student.prototype.name = function () {
  return `${this.f_name} ${this.l_name}`;
}

Student.prototype.enroll = function (courseObj) {
  
}