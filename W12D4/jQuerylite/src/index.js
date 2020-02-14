const DOMNodeCollection = require("./dom_node_collection")

$(() => {
    window.$l = function(selector) {
        const nodeList = document.querySelectorAll(selector);
        const array = Array.from(nodeList);
        return array;
    }
})