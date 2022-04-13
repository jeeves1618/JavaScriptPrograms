// 'use strict';

let knowsJavaLanguageVeryWell = true;
let approvedForTakingInterview = true;

let decisionOnInterview = 0;
if (knowsJavaLanguageVeryWell && approvedForTakingInterview)
  decisionOnInterview = 1;

let feedBack =
  decisionOnInterview == 0
    ? "No, you cannot take interview."
    : "Yes, you can take Java interviews. Just don't go wild!";

let yearOfBirth = prompt("What is your year of birth?");

document.getElementById("feedBack").innerHTML = feedBack;

//This is a function Declaration
function CalcAge1(birthYear) {
  return 2022 - birthYear;
}

let age = CalcAge1(yearOfBirth);

let ageInfo1 =
  age >= 0
    ? `Your age is ${age} years!`
    : `You haven't born yet. Are you reaching out to me from the future? If yes, can you convey a message to my younger self?`;
document.getElementById("ageInfo1").innerHTML = ageInfo1;

//This is a function Expression
let CalcAge2 = function (birthYear) {
  return 2022 - birthYear;
};

age = CalcAge1(yearOfBirth);

let ageInfo2 =
  age >= 0
    ? `You are ${age} years old!`
    : `Looks like you are going to be born in the future. And the fact that you are meddling with a old programming indicates that you are an archeologist`;
document.getElementById("ageInfo2").innerHTML = ageInfo2;

//This is an Arrow Function
CalcAge3 = (birthYear) => 2022 - birthYear;

age = CalcAge3(yearOfBirth);

let ageInfo3 = age >= 20 ? `You are getting old dude` : `You are young, enjoy!`;
document.getElementById("ageInfo3").innerHTML = ageInfo3;

CalcRetire = (birthYear) => {
  const age = CalcAge2(birthYear);
  const retirementYear = 58 - age;
  return `You will retire in ${retirementYear} years and in the year, ${
    Number(birthYear) + 58
  }`;
};

let retireInfo = CalcRetire(yearOfBirth);
document.getElementById("retireInfo").innerHTML = retireInfo;
