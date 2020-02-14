class DOMNodeCollection {
    constructor(array) {
        this.array = array;
    }

    html(string) {
        string = string || this.array[0].innerHTML

        this.array.forEach(element => {
            element.innerHTML = string;
        });
    }

    empty() {
        this.array.forEach((element) => {
            element.innerHTML = "";
        })
    }

    append(args) {
        args.forEach((element) => {
            this.array.forEach((ele) => {
                element.outerHTML += ele.innerHTML;
            })
        })
    }

    attr(prop, value) {
        if (value === undefined) {
            return this.array[0].getAttribute(prop);
        } else {
            this.array.forEach((ele) => {
                ele.setAttribute(prop, value);
            })
        }
    }

    addClass(arg) {
        this.array.forEach((ele) => {
            ele.classList.add(arg);
        })
    }

    removeClass(arg) {
        this.array.forEach((ele) => {
            ele.classList.remove(arg);
        })
    }

    children() {
        let childrenArr = [];

        this.array.forEach((ele) => {
            let childrenList = Array.from(ele.children);
            childrenArr = childrenArr.concat(childrenList);
        })
        return new DOMNodeCollection(childrenArr);
    }

    parent() {

    }
}

module.exports = DOMNodeCollection;