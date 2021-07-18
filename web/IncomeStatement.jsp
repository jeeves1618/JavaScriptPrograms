<%@page import="IncomeStatement.*"%>
<%@page import="CommonModules.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Income Statement</title>
</head>
<body>

    <style type="text/css">
        body {
            font-family: 'Courier New', Courier, monospace;
            font-size: medium;
            font: outline;
            margin: 1pt;
            background-color: AntiqueWhite;
            padding: 1%;
        }
        h1 {
            font-size: x-large;
        }
        h2 {
            font-size: large;
        }
        /* Tooltip container */
		.tooltip {
		  position: relative;
		  display: inline-block;
		  border-bottom: 1px dotted black; /* If you want dots under the hoverable text */
		}

		/* Tooltip text */
		.tooltip .tooltiptext {
		  visibility: hidden;
		  width: 320px;
		  background-color: white;
		  color: black;
		  text-align: center;
		  padding: 5px 0;
		  border-radius: 6px;
		 
		  /* Position the tooltip text - see examples below! */
		  position: absolute;
		  z-index: 1;
		}

		/* Show the tooltip text when you mouse over the tooltip container */
		.tooltip:hover .tooltiptext {
		  visibility: visible;
		}
		.button {
				  border: none;
				  color: white;
				  padding: 2px 2px;
				  text-align: center;
				  text-decoration: none;
				  display: inline-block;
				  font-size: medium;
				  margin: 0px 0px;
				  transition-duration: 0.4s;
				  cursor: pointer;
				 }
		.button2 {
					background-color: Snow;
					color: black;
					border: 2px solid #008CBA;
				}
		.button2:hover {
					background-color: SlateGray;
					color: white;
				}
    </style>
	
	<%IncomeCalculator IncomeInstanceOne = new IncomeCalculator("SalaryOne");%>
    <%IncomeInstanceOne.calculateOldTakeHome();%>
    <%IncomeCalculator IncomeInstanceTwo = new IncomeCalculator("SalaryTwo");%>
    <%IncomeInstanceTwo.calculateOldTakeHome();%>
	<%double SalesRevenue = IncomeInstanceOne.getGrossSalary() + IncomeInstanceTwo.getGrossSalary();%>

    <%ExpenseCalculator ExpenseInstanceOne = new ExpenseCalculator("One", "Sal1");%>
    <%ExpenseCalculator ExpenseInstanceTwo = new ExpenseCalculator("Two", "Sal1");%>
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
	<%double discretionaryExpenses = (ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses() +
                    ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments());%>
   
    <script>
        var jsVariable='<%= (ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance())*100/(ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses())%>';
    </script>
    <div>
        <h2 align=center>Income Statement</h2>
        <table border=1; align=center>
            <col width="1126	"> 
            <col width="180"> 
          
            <tr><td align="center" colspan="2"><%= ExpenseInstanceOne.getTimePeriod()%></td></tr>
            <tr><td align="left" ><div class="tooltip">Sales/Revenue (A)<span class="tooltiptext">Sales are recorded on the Income statement when the company actually ships products to customers. For this personal income statement, gross salary can be considered.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(SalesRevenue))%></td></tr>
            <tr><td align="left" ><div class="tooltip">Cost of Goods Sold (COGS) (B)<span class="tooltiptext">COGS is usually the amount spent on creating the goods or services considered as part of Sales (above). For this personal income statement, this will be non discretionary expenses.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(nonDiscretionaryExpenses*10))%></td></tr>
			<tr><td align="left" ><div class="tooltip"><b>Gross Margin or Gross Income (C) = (A) - (B)</b><span class="tooltiptext">Gross Margin is the amount left over from sales after product manufacturing costs are subtracted. For this personal income statement, this will be the difference between gross salary and non discretionary expenses.</span></div></td>
                <td align="right"><b><%= rf.formattedRupee(ft.format(SalesRevenue-(nonDiscretionaryExpenses*10)))%></b></td></tr> 
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip">Selling, General and Administrative Expense(SG and A) (D)<span class="tooltiptext">Expenses related to Sales, Marketing, Research, Development, General and administrative items are listed here. For this personal income statement, I am loosely translating that into my discretionary expenses.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(discretionaryExpenses*10))%></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip"><b>Income from Operations (E) = (C) - (D)</b><span class="tooltiptext">Income from operations is the amount left over from sales after product manufacturing costs are subtracted. For this personal income statement, this will be the difference between gross salary and all our expenses.</span></div></td>
                <td align="right"><b><%= rf.formattedRupee(ft.format(SalesRevenue-(nonDiscretionaryExpenses*10)-(discretionaryExpenses*10)))%></b></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip">Interest Income (F)<span class="tooltiptext">Interest income or expense is the sum of all interests received minus the sum of all interests paid on outstanding debts. For this personal income statement, this will be the difference between interest credited and the interest debited.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getInterestIncome() + ExpenseInstanceTwo.getInterestIncome())*10))%></td></tr>
			<tr><td align="left" ><div class="tooltip">Income Taxes (G)<span class="tooltiptext">Taxes on Income. For this personal income statement, this will be the taxes deducted at source.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format((IncomeInstanceOne.getTotalTax() + IncomeInstanceOne.getTotalTax())))%></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip"><b>Net Income (K) = (E) + (F) - (G)</b><span class="tooltiptext">So, the income statement summarizes the financial impact of movement of goods to customers minus the costs and expenses incurred to get the value created in the process</span></div></td>
                <td align="right"><b><%= rf.formattedRupee(ft.format((SalesRevenue-(nonDiscretionaryExpenses*10)-(discretionaryExpenses*10))+((ExpenseInstanceOne.getInterestIncome() + ExpenseInstanceTwo.getInterestIncome())*10) - (IncomeInstanceOne.getTotalTax() + IncomeInstanceOne.getTotalTax())))%></b></td></tr>
		</table>
        <table border=1; align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260">  
            <tr><td align="center"><a href="http://localhost:8090/FinancialStatements/" class="button button2">Balance Sheet</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp" class="button button2">Cash Flow Statement</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp" class="button button2">Account Payables</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
                <td align="center"><a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp" class="button button2">Chart of Accounts</a></td>
            </tr>
			<tr><td align="center" colspan="3"><a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30" class="button button2">Financial Independence and Early Retirement</a></td>
				<td align="center" colspan="2"><a href="http://localhost:8090/FinancialStatements/ExpenseSplit.jsp" class="button button2">Expense Split</a></td>
			</tr>
        </table>
    </div>
</body>
</html>