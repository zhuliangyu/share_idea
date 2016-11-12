// Visit this page http://vancouver.craigslist.ca and write a piece of jQuery code that changes all the links on the home page to have a color red if the link's anchor text includes the pattern eal (5%)

$("a:contains('eal')").css("color", 'red');


//     Visit a Wikipedia page like this one: https://en.wikipedia.org/wiki/Rule_of_three_(computer_programming) then write a peice of jQuery code that will fadeOut any link you click on without following the link. (5%)

 $('a').on('click', function (event) {
    event.preventDefault();
    $(this).fadeOut(100);
});


//     Write a Javascript code to do the following: Implement filter function in Javascript (5%)

// var isEven = function (x) { return x % 2 == 0; };
// filter([1, 2, 3, 4], isEven);
// => [2, 4]

var isEven = function (x) {
    return x % 2 == 0;
};


function filter(arr, fn) {
    var result = [];

    for (var i = 0; i < arr.length; i++) {
        if (fn(arr[i])) {

            result.push(arr[i]);

        }
    }
    return result;
}

console.log(filter([1, 2, 3, 4], isEven));
