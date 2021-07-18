<%@page import="IncomeStatement.*"%>
<%@page import="CommonModules.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Split</title>
</head>
<body>

    <style type="text/css">
        body {
            font-family: 'Courier New', Courier, monospace;
            font-size: medium;
            font: outline;
            margin: 1pt;
            background-color: FloralWhite;
            padding: 1%;
        }
        h1 {
            font-size: x-large;
        }
        h2 {
            font-size: large;
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

    <%ExpenseCalculator ExpenseInstanceOne = new ExpenseCalculator("Two", "Sal1");%>
    <%ExpenseCalculator ExpenseInstanceTwo = new ExpenseCalculator("One", "Sal1");%>
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
					ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses() +
                    ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI());%>
    <div>
        <h2 align=center>Payables Segmentation</h2>
        
        <table border=1; align=center>   
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
                <td align="left">Education Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses())/
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
        <table border=1;  align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260">  
            <tr><td align="center"><a href="http://localhost:8090/FinancialStatements/" class="button button2">Balance Sheet</a></td>
                <td align="center"><a href="http://localhost:8090/FinancialStatements/IncomeStatement.jsp" class="button button2">Income Statement</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp" class="button button2">Cash Flow Statement</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
                <td align="center"><a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp" class="button button2">Chart of Accounts</a></td>
            </tr>
			<tr><td align="center" colspan="3"><a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30" class="button button2">Financial Independence and Early Retirement</a></td>
				<td align="center" colspan="2"><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp" class="button button2">Account Payables</a></td>
			</tr>
        </table>
    </div>
</body>
</html>