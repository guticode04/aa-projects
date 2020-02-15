const todoContainer = document.querySelector('.todos');
const addTodos = document.querySelector('.add-todo-form');

addTodos.addEventListener("submit", function (event) {
  event.preventDefault();
  const input = addTodos.querySelector("[name='add-todo']");
  addTodo(input);
  input.value = "";
})

const addTodo = (input) => {
    const toDo = {};
    toDo.done = false;
    toDo.value = input.value;
    saveToDo(toDo);
    renderTodo(toDo);

}

const renderTodo = (obj) => {
  const li = document.createElement("li");
  li.setAttribute("data-done", obj.done);
  li.innerHTML = obj.value;
  todoContainer.appendChild(li);
 
}

const saveToDo = (todo) => {
  let todos = getToDos();
  if ( todos === null ){
    todos = [];
  }
  todos.push(todo);
//   obj {
//       done: false,
//       value: something.
//   }
// -> [{"done": "something"}] <- json stringified
  const jTodo = JSON.stringify(todos);
  localStorage.setItem("todos", jTodo);
}

const getToDos = () => {
  const temp = localStorage.getItem("todos");
  const todos = JSON.parse(temp);
  return todos;
}

const populateList = () => {
  const gTodos = getToDos();
  for (const todo of gTodos ) {
    renderTodo(todo);
  }
  
}

populateList();