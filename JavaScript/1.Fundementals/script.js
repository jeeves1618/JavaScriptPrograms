let life = "What the hell!";
if (life === "What the hell") console.log(13 + 7 + 1);
else console.log("hey I am in else condition");

console.log(typeof life);

life = 169;

console.log(typeof life);

let gList = [
  "Blind Watchmaker",
  "Republic",
  "Indian Trilogy",
  "Languages of Truth",
  "Post American World",
  "Liars Poker",
  "The Third Pillar",
  "Digital Gold",
];

let who = Math.floor(Math.random() * 8 + 1);

let x = gList[who - 1];
console.log(x, who - 1);
document.getElementById("Date").innerHTML = x;

console.log(who);

console.log(gList[1]);

let favorite = prompt("Who is your favorite?");
console.log(favorite);

let be = 7184373.41;
let bu = 12516853.92;

console.log(be + bu, 20000000 - (be + bu));

console.log("I am used to having " + 3 + " meals a day");
console.log("24" + 13);
console.log("24" + 13);
console.log("24" - 13);
console.log("24" - 13);
console.log("4" * 2);
console.log("4" / 2);
console.log("4" % 2);
