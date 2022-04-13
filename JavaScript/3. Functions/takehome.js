"use strict";

let salarySlab = [250000, 250000, 500000, 1000000];
let taxRate = [0.0, 5.2, 20.8, 31.2];
let houseLoanInt = 200000.0;
let section80c = 150000.0;
let standardDeduction = 50000.0;
let employmentTax = 2500.0;
let taxSurchargeFactor = 1;
let totalTax = 0;

//let annualGrossSalary = prompt("What is your Annual Gross Salary?");
let annualGrossSalary = 1300000;
console.log(document.getElementById("grossSalaryEntered"));

let taxableAmount =
  annualGrossSalary -
  houseLoanInt -
  section80c -
  standardDeduction -
  employmentTax;

if (taxableAmount >= 5000000) taxSurchargeFactor = 1.1;

let grossSalary = annualGrossSalary / 12;

let basicSalary = grossSalary * 0.4;
let pf = basicSalary * 0.12;

let formatAmount = function (amount) {
  let amountString = amount.toFixed(2).toString();
  let lengthOfString = amountString.length;
  let amountFormatter = [
    "n",
    "n",
    ".",
    "n",
    "n",
    "n",
    ",",
    "n",
    "n",
    ",",
    "n",
    "n",
    ",",
    "n",
    "n",
    ",",
    "n",
    "n",
    ",",
    "n",
    "n",
  ];
  let amountFormatterItr = 0;
  let cAmountString = " ";
  let charAtString;

  for (let i = lengthOfString - 1; i >= 0; i--) {
    if (
      amountFormatter[amountFormatterItr] === "n" ||
      amountFormatter[amountFormatterItr] === "."
    ) {
      charAtString = amountString.charAt(i);
    } else {
      charAtString = amountFormatter[amountFormatterItr];
      cAmountString = charAtString + cAmountString;
      charAtString = amountString.charAt(i);
      amountFormatterItr++;
    }
    cAmountString = charAtString + cAmountString;
    amountFormatterItr++;
  }
  cAmountString = "Rs. " + cAmountString;
  return cAmountString;
};

let grossSalaryFmtd = formatAmount(grossSalary);
let basicSalaryFmtd = formatAmount(basicSalary);
let pfFmtd = formatAmount(pf);

for (let i = 0; i < 5 && taxableAmount > 0; i++) {
  totalTax = totalTax + (salarySlab[i] * taxRate[i]) / 100;
  taxableAmount = taxableAmount - salarySlab[i];
  if (i == 2) {
    salarySlab[i + 1] = taxableAmount;
  }
}

totalTax = totalTax * taxSurchargeFactor;
let monthlyTax = totalTax / 12;
let monthlyTakeHome =
  (annualGrossSalary - totalTax - employmentTax - pf * 12) / 12;

let monthlyTaxFmtd = formatAmount(monthlyTax);
let monthlyTakeHomeFmtd = formatAmount(monthlyTakeHome);

document.getElementById("grossSalary").innerHTML = grossSalaryFmtd;
document.getElementById("basicSalary").innerHTML = basicSalaryFmtd;
document.getElementById("pf").innerHTML = pfFmtd;
document.getElementById("monthlyTax").innerHTML = monthlyTaxFmtd;
document.getElementById("monthlyTakeHome").innerHTML = monthlyTakeHomeFmtd;
