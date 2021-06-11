<%@page import="IncomeStatement.*"%>
<%@page import="CommonModules.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Payables</title>
</head>
<body>

    <style type="text/css">
        body {
            font-family: 'Courier New', Courier, monospace;
            font-size: medium;
            font: outline;
            margin: 1pt;
            background-color: aquamarine;
            padding: 1%;
        }
        h1 {
            font-size: x-large;
        }
        h2 {
            font-size: large;
        }
        .split {
                height: 100%;
                width: 73.1%;
                position: fixed;
                z-index: 1;
                top: 0;
                overflow-x: hidden;
                padding-top: 2px;
                }

        .left {
        left: 0;
        background-color: #FCF3CF;
        padding: 5px;
        }

        .right {
        right: 0;
        width: 28.5%;
        text-align: right;
        padding: 5px;
        background-color:#EAFAF1;
        }
    </style>

    <%ExpenseCalculator ExpenseInstanceOne = new ExpenseCalculator("Ben", "Sal1");%>
    <%ExpenseCalculator ExpenseInstanceTwo = new ExpenseCalculator("Bun", "Sal1");%>
    <%DecimalFormat ft = new DecimalFormat("Rs ##,##,##0.00");%>
    <%DecimalFormat pc = new DecimalFormat("##,##,##0.00 %");%>
    <%RupeeFormatter rf = new RupeeFormatter();%>
    <%double nonDiscretionaryExpenses = (ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance() + 
                    ExpenseInstanceOne.getElectricityBill() + ExpenseInstanceTwo.getElectricityBill() +
                    ExpenseInstanceOne.getCreditCardBill() + ExpenseInstanceTwo.getCreditCardBill() +
                    ExpenseInstanceOne.getBrokerageMaintenance() + ExpenseInstanceTwo.getBrokerageMaintenance() +
                    ExpenseInstanceOne.getHomeInsurance() + ExpenseInstanceTwo.getHomeInsurance() +
                    ExpenseInstanceOne.getCashWithdrawals() + ExpenseInstanceTwo.getCashWithdrawals() +
                    ExpenseInstanceOne.getGroceryExpenses() + ExpenseInstanceTwo.getGroceryExpenses() +
                    ExpenseInstanceOne.getTravelExpense() + ExpenseInstanceTwo.getTravelExpense() +
                    ExpenseInstanceOne.getFamilyExpenses() + ExpenseInstanceTwo.getFamilyExpenses() + 
                    ExpenseInstanceOne.getShoppingExpense() + ExpenseInstanceTwo.getShoppingExpense() + 
                    ExpenseInstanceOne.getHousekeepingExpenses() + ExpenseInstanceTwo.getHousekeepingExpenses() + 
                    ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses() +
                    ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI());%>
    <div class="split right">
        <h2 align=center>Payables Segmentation</h2>
        
        <table border=1; style="float:right">   
            <col width="280"> 
            <col width="80">
            <tr><td align="center" colspan="2"><b>Non Discretionary Expense Split</b></td></tr>

            <tr>
                <td align="left">Apartment Maintenance</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance())/
                    (nonDiscretionaryExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Electricity Bill</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getElectricityBill() + ExpenseInstanceTwo.getElectricityBill())/
                    (nonDiscretionaryExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Miscellaneous</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getCreditCardBill() + ExpenseInstanceTwo.getCreditCardBill())/
                    (nonDiscretionaryExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Trading Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getBrokerageMaintenance() + ExpenseInstanceTwo.getBrokerageMaintenance())/
                    (nonDiscretionaryExpenses))%></td>
            </tr>
            <tr>
                <td align="left">Insurance</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getHomeInsurance() + ExpenseInstanceTwo.getHomeInsurance())/
                    (nonDiscretionaryExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Cash Withdrawals</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getCashWithdrawals() + ExpenseInstanceTwo.getCashWithdrawals())/
                    (nonDiscretionaryExpenses))%></td>
            </tr>

            <tr>
                <td align="left">Groceries</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getGroceryExpenses() + ExpenseInstanceTwo.getGroceryExpenses())/
                    (nonDiscretionaryExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Travel Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTravelExpense() + ExpenseInstanceTwo.getTravelExpense())/
                    (nonDiscretionaryExpenses))%></td>
            </tr>
            <tr>
                <td align="left">Extended Family</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getFamilyExpenses() + ExpenseInstanceTwo.getFamilyExpenses())/
                    (nonDiscretionaryExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Shopping Eat Outs</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getShoppingExpense() + ExpenseInstanceTwo.getShoppingExpense())/
                    (nonDiscretionaryExpenses))%></td>
            </tr>

            <tr>
                <td align="left">Entertainment</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses())/
                    (nonDiscretionaryExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Domestic Help</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getHousekeepingExpenses() + ExpenseInstanceTwo.getHousekeepingExpenses())/
                    (nonDiscretionaryExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Home Loan EMIs</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI())/
                    (nonDiscretionaryExpenses))%></td>
            </tr>
            
            <tr><td align="center" colspan="2"><b>Expenses - Key Ratios</b></td></tr>            
            
            <tr>
                <td align="left">Non Discretionary Vs Expense</td>
                <td align="right"><%= pc.format((nonDiscretionaryExpenses)/
                    (ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses()))%></td>
            </tr>
            <tr>
                <td align="left">Non Discretionary Vs Income</td>
                <td align="right"><%= pc.format(nonDiscretionaryExpenses/
                    (ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()))%></td>
            </tr>
            
            <tr>
                <td align="left">Discretionary Vs Expense</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments())/
                    (ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses()))%></td>
            </tr>

            <tr>
                <td align="left">Discretionary vs Income</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments())/
                    (ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()))%></td>
            </tr>
            
            <tr>
                <td align="left">Expenses vs Income</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTotalExpenses() + ExpenseInstanceTwo.getTotalExpenses())/
                    (ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()))%></td>
            </tr>

            <tr>
                <td align="left">Savings vs Income</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTotalSavings() + ExpenseInstanceTwo.getTotalSavings())/
                    (ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()))%></td>
            </tr>
            
        </table>
    </div>
    <script>
        var jsVariable='<%= (ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance())*100/(ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses())%>';
    </script>
    <div class="split left">
        <h2 align=center>Account Payables</h2>
        <table border=1; style="float:right">
            <col width="340"> 
            <col width="180"> 
            <col width="340"> 
            <col width="180">  
            <tr><td align="center" colspan="4"><%= ExpenseInstanceOne.getTimePeriod()%></td></tr>
            <tr><td align="center" colspan="2"><b>Ben - Monthly Summary</b></td>
                <td align="center" colspan="2"><b>Bun - Monthly Summary</b></td></tr>
                        
            <tr><td align="left" >Ben Income</td>
                <td align="right"><%= ExpenseInstanceOne.getTotalIncomeFmtd()%></td>
                <td align="left" >Bun Income</td>
                <td align="right"><%= ExpenseInstanceTwo.getTotalIncomeFmtd()%></td>
            </tr>
            
            <tr><td align="left" >Ben Expenses</td>
                <td align="right"><%= ExpenseInstanceOne.getTotalExpensesFmtd()%></td>
                <td align="left" >Bun Expenses</td>
                <td align="right"><%= ExpenseInstanceTwo.getTotalExpensesFmtd()%></td>
            </tr>

            <tr><td align="left" >Ben Savings</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getTotalIncome() - ExpenseInstanceOne.getTotalExpenses()))%></td>
                <td align="left" >Bun Savings</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceTwo.getTotalIncome() - ExpenseInstanceTwo.getTotalExpenses()))%></td>
            </tr>

            <tr><td align="center" colspan="2"><b>Monthly Income Split</b></td>
                <td align="center" colspan="2"><b>Monthly Expense Split</b></td></tr>
                        
            <tr><td align="left" >Salary Income</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getSalaryIncome() + ExpenseInstanceTwo.getSalaryIncome()))%></td>
                <td align="left" >Apartment Maintenance</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance()))%></td>
            </tr>

            <tr><td align="left" >Interest Income</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getInterestIncome() + ExpenseInstanceTwo.getInterestIncome()))%></td>
                <td align="left" >Electricity Bill</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getElectricityBill() + ExpenseInstanceTwo.getElectricityBill()))%></td>
            </tr>
                        
            <tr><td align="left" >Dividend Income</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getDividendIncome() + ExpenseInstanceTwo.getDividendIncome()))%></td>
                <td align="left" >Miscellaneous</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getCreditCardBill() + ExpenseInstanceTwo.getCreditCardBill()))%></td>
            </tr>

            <tr><td align="left" >Rental Income</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getRentalIncome() + ExpenseInstanceTwo.getRentalIncome()))%></td>
                <td align="left" >Trading Expenses</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getBrokerageMaintenance() + ExpenseInstanceTwo.getBrokerageMaintenance()))%></td>
            </tr>
                        
            <tr><td align="left" >Maturity of Savings</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getSaleProceeds() + ExpenseInstanceTwo.getSaleProceeds()))%></td>
                <td align="left" >Home, Car, Personal Insurance</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getHomeInsurance() + ExpenseInstanceTwo.getHomeInsurance()))%></td>
            </tr>

            <tr><td align="left" >Capital Gains</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getCapitalGains()))%></td>
                <td align="left" >Cash Withdrawals</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getCashWithdrawals() + ExpenseInstanceTwo.getCashWithdrawals()))%></td>
            </tr>
                        
            <tr><td align="left" >Monetary Gifts</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getMonetaryGifts()))%></td>
                <td align="left" >Groceries</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getGroceryExpenses() + ExpenseInstanceTwo.getGroceryExpenses()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Travel Expenses</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getTravelExpense() + ExpenseInstanceTwo.getTravelExpense()))%></td>
            </tr>
                        
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Extended Family Care</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getFamilyExpenses() + ExpenseInstanceTwo.getFamilyExpenses()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Shopping and Eat Outs</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getShoppingExpense() + ExpenseInstanceTwo.getShoppingExpense()))%></td>
            </tr>
                        
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Entertainment and Connectivity</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Domestic Help</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getHousekeepingExpenses() + ExpenseInstanceTwo.getHousekeepingExpenses()))%></td>
            </tr>
                        
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Home Improvement</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Home Loan EMIs</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><b>Discretionary Spending</b></td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses() +
                    ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments()))%></td>
            </tr>
            
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Non Discretionary Spending</td>
                <td align="right"><%= rf.formattedRupee(ft.format(nonDiscretionaryExpenses))%>
                </td>
            </tr>
            <tr><td align="left" ><b>Total Income </b></td>
                <td align="right"><%= rf.formattedRupee(ft.format(
                    ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()
                ))
                    %></td>
                <td align="left" ><b>Total Expenses</b></td>
                <td align="right"><%= rf.formattedRupee(ft.format(
                    nonDiscretionaryExpenses + ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments()))%>
                </td>
            </tr>
			</table>
            <table border=1; style="float:right">
			<col width="320"> 
			<col width="320"> 
			<col width="320"> 
			<col width="320"> 
            <tr><td align="center"><a href="http://localhost:8090/FinancialStatements/">Balance Sheet</a></td>
                <td align="center"><a href="http://localhost:8090/FinancialStatements/IncomeStatement.jsp">Income Statement</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp">Cash Flow Statement</td>
                <td align="center"><a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp">Chart of Accounts</a></td>
            </tr>
        </table>
    </div>
</body>
</html>