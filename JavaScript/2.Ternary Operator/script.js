let bList = [
  "Blind Watchmaker",
  "Republic",
  "Indian Trilogy",
  "Languages of Truth",
  "Post American World",
  "Liars Poker",
  "The Third Pillar",
  "Digital Gold",
];
let aList = [
  "Richard Dawkings",
  "Plato",
  "V.S Naipual",
  "Salman Rushdie",
  "Fareed Zarkaria",
  "Micheal Lewis",
  "Raguraman Rajan",
  "Natheniel Popper",
];

let who = Math.floor(Math.random() * 8 + 1);

let book = bList[who - 1];
console.log(book, who - 1);
document.getElementById("Date").innerHTML = book;

book == "Blind Watchmaker"
  ? (feedBack = `For me, there are only two types people in world. The ones who have read ${
      bList[who - 1]
    } and the ones who haven't.`)
  : (feedBack = `Wow, it is a treasure trove of information. Trust me, ${
      aList[who - 1]
    } is a genius.`);
document.getElementById("feedBack").innerHTML = feedBack;

//An operator always produces an value. The ternary operator will also produce a value. And that value can be stored.

let additionalRemark =
  book == "Blind Watchmaker"
    ? " Welcome to the club of miniscule minority!"
    : book == "Republic"
    ? " But, Plato's language is tiring"
    : ` I have read ${bList[who - 1]} multiple times`;
document.getElementById("additionalRemark").innerHTML = additionalRemark;

console.log(additionalRemark);
