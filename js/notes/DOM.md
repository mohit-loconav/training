# Document Object Model(DOM)

## Selecting Elements
* `getElementById`, `getElementsByClass`, `querySelector` works for both document and dom element object.


## Element properties
* `.textContent`: outputs all underlying hidden/non-user based text(display: none;) text **[Node.textContent](https://developer.mozilla.org/en-US/docs/Web/API/Node/textContent)**
* `.innerHTML`: outputs all underlying html
* `.innerText`: outputs onlu human readable, that renders on page
* `.childNodes vs .children`: children prints only elements but childNodes will list all nodes including texts which were not wrapped in any html element
* `.remove`: delete an element from DOM but it is still present in memory

## Attributes
* We shouldn't make data attributes of any name, instead try to make like 'data-ATTRIBUTE_NAME'. This is accessible by [element.dataset](https://developer.mozilla.org/en-US/docs/Web/API/HTMLOrForeignElement/dataset)


## Events
* `event.target` will result in actual target whereas `event.currentTarget` will return the parent on which event listener is attatched
*  `event.stopPropagation`: it will stop the traversing of nodes and their event listeners
* [`IntersectionObserver`](https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API): a class, it takes a callback and observers an element assigned by method `.observer(element)` 