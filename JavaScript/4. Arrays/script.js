"use strict";
//An operator always produces an value. The ternary operator will also produce a value. And that value can be stored.

let titleList = new Array(
  "Blind Watchmaker",
  "Republic",
  "Indian Trilogy",
  "Languages of Truth",
  "Post American World",
  "Liars Poker",
  "The Third Pillar",
  "Digital Gold"
);
let chapterList = new Array(17, 24, 37, 26);
let readingPlans = [`from back to front`, `from front to back`, `randomly`];
let formats = [`dust cover on`, `dust cover off`];

let book = {
  title: `${titleList[Math.floor(Math.random() * titleList.length)]}`,
  chapters: `${chapterList[Math.floor(Math.random() * chapterList.length)]}`,
  readingPlan: `${
    readingPlans[Math.floor(Math.random() * readingPlans.length)]
  }`,
  format: `${formats[Math.floor(Math.random() * formats.length)]}`,
};

let bookList = [book];

titleList.unshift("Prosperous Peace");

book = {
  title: `${titleList[Math.floor(Math.random() * titleList.length)]}`,
  chapters: `${chapterList[Math.floor(Math.random() * chapterList.length)]}`,
  readingPlan: `${
    readingPlans[Math.floor(Math.random() * readingPlans.length)]
  }`,
  format: `${formats[Math.floor(Math.random() * formats.length)]}`,
};

bookList.push(book);

book = {
  title: `${titleList[Math.floor(Math.random() * titleList.length)]}`,
  chapters: `${chapterList[Math.floor(Math.random() * chapterList.length)]}`,
  readingPlan: `${
    readingPlans[Math.floor(Math.random() * readingPlans.length)]
  }`,
  format: `${formats[Math.floor(Math.random() * formats.length)]}`,
};

bookList.push(book);

formats.includes();
//Remove Last Element
formats.pop();

//Remove first Element
formats.shift();

book = {
  title: `${titleList[Math.floor(Math.random() * titleList.length)]}`,
  chapters: `${chapterList[Math.floor(Math.random() * chapterList.length)]}`,
  readingPlan: `${
    readingPlans[Math.floor(Math.random() * readingPlans.length)]
  }`,
  format: `${formats[Math.floor(Math.random() * formats.length)]}`,
};
bookList.push(book);
let remark = ``;
for (let i = 0; i < bookList.length; i++) {
  remark =
    remark +
    `
    I am planning to start with ${bookList[i].title}, which is ${bookList[i].chapters} chapters long, and read it ${bookList[i].readingPlan} with the ${bookList[i].format}.`;
}
console.log("The Remark is " + remark);
document.getElementById("remark").innerHTML = remark;
