'use strict';

let salarySlab = [250000, 250000, 500000, 1000000];
let taxRate = [0.0, 5.2, 20.8, 31.2];
let houseLoanInt = 200000.0;
let section80c = 150000.0;
let standardDeduction = 50000.0;
let employmentTax = 2500.0;
let taxSurchargeFactor = 1;
let totalTax = 0;

let annualGrossSalary = prompt("What is your Annual Gross Salary?");

let taxableAmount = annualGrossSalary - houseLoanInt - section80c -standardDeduction -employmentTax;

if (taxableAmount >= 5000000) taxSurchargeFactor = 1.1;

let grossSalary = annualGrossSalary/12;

let basicSalary = grossSalary * 0.4;
let pf = basicSalary * 0.12;

let grossSalaryFmtd = "Rs. " + grossSalary; 
let basicSalaryFmtd = "Rs. " + basicSalary;
let pfFmtd = "Rs. " + pf;

for(let i = 0; i < 5 && taxableAmount > 0; i++){
    totalTax = totalTax + (salarySlab[i] * taxRate[i]/100);
    taxableAmount = taxableAmount - salarySlab[i];
    if (i == 2) {
        salarySlab[i + 1] = taxableAmount;
    }
}

totalTax = totalTax * taxSurchargeFactor;
let monthlyTax = totalTax/12;
let monthlyTakeHome = (annualGrossSalary - totalTax - employmentTax - (pf*12))/12;

let monthlyTaxFmtd = "Rs. " + monthlyTax;
let monthlyTakeHomeFmtd = "Rs. " + monthlyTakeHome

document.getElementById("grossSalary").innerHTML = grossSalaryFmtd;
document.getElementById("basicSalary").innerHTML = basicSalaryFmtd;
document.getElementById("pf").innerHTML = pfFmtd;
document.getElementById("monthlyTax").innerHTML = monthlyTaxFmtd;
document.getElementById("monthlyTakeHome").innerHTML = monthlyTakeHomeFmtd;

