<%@page import="IncomeStatement.*"%>
<%@page import="CommonModules.*"%>
<%@page import="PerformanceAnalyzer.*"%>	
<%@page import="ViewServices.*"%>
<%@ page import="com.google.gson.*"%>
<%@page import="java.text.*"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%ExpenseCalculator ExpenseInstanceTwo = new ExpenseCalculator("One", "Sal1");%>
	<%ExpenseCalculator ExpenseInstanceOne = new ExpenseCalculator("Two", "Sal1");%>
	<%GainsCalculator GainsInstanceOne = new GainsCalculator("One", "Sav1");%>
    <%GainsCalculator GainsInstanceTwo = new GainsCalculator("Two", "Sav1");
	ViewChartOfAccounts viewChartOfAccounts = new ViewChartOfAccounts();
		String herName = viewChartOfAccounts.getHerName();
		String hisName = viewChartOfAccounts.getHisName();%>
    <%DecimalFormat ft = new DecimalFormat("Rs ##,##,##0.00");%>
    <%DecimalFormat pc = new DecimalFormat("##,##,##0.00 %");%>
    <%RupeeFormatter rf = new RupeeFormatter();%>
    <%double nonDiscretionaryExpenses = ExpenseInstanceOne.getNonDiscretionaryExpenses() + ExpenseInstanceTwo.getNonDiscretionaryExpenses();%>
 <%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("label", "Home Loan EMIs"); map.put("y", Math.round(((ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI())*100/nonDiscretionaryExpenses)*100.0)/100.0); list.add(map); 
map = new HashMap<Object,Object>(); map.put("label", "Apartment"); map.put("y", Math.round(((ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance())*100/nonDiscretionaryExpenses)*100.0)/100.0); map.put("exploded", true); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Electricity"); map.put("y", Math.round(((ExpenseInstanceOne.getElectricityBill() + ExpenseInstanceTwo.getElectricityBill())*100/nonDiscretionaryExpenses)*100.0)/100.0); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Amazon Purchases"); map.put("y", Math.round(((ExpenseInstanceOne.getCreditCardBill() + ExpenseInstanceTwo.getCreditCardBill())*100/nonDiscretionaryExpenses)*100.0)/100.0); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Trading Expenses"); map.put("y", Math.round(((ExpenseInstanceOne.getBrokerageMaintenance() + ExpenseInstanceTwo.getBrokerageMaintenance())*100/nonDiscretionaryExpenses)*100.0)/100.0); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Insurance"); map.put("y", Math.round(((ExpenseInstanceOne.getHomeInsurance() + ExpenseInstanceTwo.getHomeInsurance())*100/nonDiscretionaryExpenses)*100.0)/100.0); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Cash"); map.put("y", Math.round(((ExpenseInstanceOne.getCashWithdrawals() + ExpenseInstanceTwo.getCashWithdrawals())*100/nonDiscretionaryExpenses)*100.0)/100.0); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Groceries"); map.put("y", Math.round(((ExpenseInstanceOne.getGroceryExpenses() + ExpenseInstanceTwo.getGroceryExpenses())*100/nonDiscretionaryExpenses)*100.0)/100.0); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Travel Expenses"); map.put("y", Math.round(((ExpenseInstanceOne.getTravelExpense() + ExpenseInstanceTwo.getTravelExpense())*100/nonDiscretionaryExpenses)*100.0)/100.0); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Extended Family"); map.put("y", Math.round(((ExpenseInstanceOne.getFamilyExpenses() + ExpenseInstanceTwo.getFamilyExpenses())*100/nonDiscretionaryExpenses)*100.0)/100.0); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Shopping and Eat Outs"); map.put("y", Math.round(((ExpenseInstanceOne.getShoppingExpense() + ExpenseInstanceTwo.getShoppingExpense())*100/nonDiscretionaryExpenses)*100.0)/100.0); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Entertainment and Connectivity"); map.put("y", Math.round(((ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses())*100/nonDiscretionaryExpenses)*100.0)/100.0); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Education, Laptop, etc."); map.put("y", Math.round(((ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses())*100/nonDiscretionaryExpenses)*100.0)/100.0); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Domestic Help"); map.put("y", Math.round(((ExpenseInstanceOne.getHousekeepingExpenses() + ExpenseInstanceTwo.getHousekeepingExpenses())*100/nonDiscretionaryExpenses)*100.0)/100.0); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Healthcare"); map.put("y", Math.round(((ExpenseInstanceOne.getdHealthCareExpenses() + ExpenseInstanceTwo.getdHealthCareExpenses())*100/nonDiscretionaryExpenses)*100.0)/100.0); list.add(map);
 
String dataPoints = gsonObj.toJson(list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Payables</title>
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	animationEnabled: true,
	exportFileName: "New Year Resolutions",
	exportEnabled: true,
	title:{
		text: " "
	},
	data: [{
		type: "pie",
		showInLegend: true,
		legendText: "{label}",
		toolTipContent: "{label}: <strong>{y}%</strong>",
		indexLabel: "{label} {y}%",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
 
chart.render();
 
}
</script>
</head>
<body>

    <style type="text/css">
        body {
            font-family: 'Courier New', Courier, monospace;
            font-size: medium;
            font: outline;
            margin: 1pt;
            background-color: white;
            padding: 1%;
        }
        h1 {
            font-size: x-large;
        }
        h2 {
            font-size: large;
        }
		.center {
			margin: auto;
			border: 1px solid black;
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
		.button1 {
					background-color: Snow;
					color: black;
					border: 2px solid #008CBA;
				}
		.button2 {
					background-color: Snow;
					color: black;
					border: 2px solid #008CBA;
					width: 90%;
				}
		.button3 {
					background-color: Snow;
					color: red;
					border: 2px solid #008CBA;
					width: 90%;
				}
		.button2:hover {
					background-color: SlateGray;
					color: white;
				}
		.button3:hover {
					background-color: red;
					color: white;
				}
    </style>

    <script>
        var jsVariable='<%= (ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance())*100/(ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses())%>';
    </script>
    <div>
        <h2 align=center> Accounts Payables Monthly </h2>
		</table>
           <table border=1; align=center>
        <col width="260"> 
        <col width="260"> 
        <col width="260"> 
        <col width="260"> 
		<col width="260"> 
			<tr><td align="center"><a href="http://localhost:8090/FinancialStatements/" class="button button2">Balance Sheet</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp" class="button button2">Account Payables</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
				<td align="center" colspan="1"><a href="http://localhost:8090/FinancialStatements/ExpenseSplit.jsp" class="button button2">Expense Split</a></td>
				<td align="center"><a href="http://localhost:8090/FinancialStatements/NetworthHistory.jsp?operation=View" class="button button2">Tradeable Assets</a></td>
			</tr>
			<tr>
				<td align="center" colspan="1"><a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30" class="button button2">F.I.R.E</a></td>
				<td align="center"><a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp" class="button button2">Chart of Accounts</a></td>
				<td align="center" colspan="1"><a href="http://localhost:8090/FinancialStatements/manageNLP.jsp" class="button button2">NLP Processor</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp" class="button button2">Cash Flow Statement</td>
				<td align="center" colspan="1" color="red"><a href="http://localhost:8090/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown" class="button button3">Unknown Transactions</a></td>
			</tr>
		</table>
		<div id="blankLine" style="height: 25px; width: 100%;"></div>
		<div class="center"; id="chartContainer"; style="height: 470px; width: 69.99%;"></div>
		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		<div id="blankLine" style="height: 25px; width: 100%;"></div>
        <table border=1; align=center>
            <col width="471"> 
            <col width="180"> 
            <col width="471"> 
            <col width="180">  
            <tr><td align="right" colspan="4"><b><%= ExpenseInstanceOne.getTimePeriod()%></b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			<a href="http://localhost:8090/FinancialStatements/AccountsPayableAnnual.jsp" class="button button1">Yearly View</button></td></tr>
            <tr><td align="center" colspan="2"><b><%= herName%> - Monthly Summary</b></td>
                <td align="center" colspan="2"><b><%= hisName%> - Monthly Summary</b></td></tr>
                        
            <tr><td align="left" ><%= herName%>'s Income</td>
                <td align="right"><%= ExpenseInstanceOne.getTotalIncomeFmtd()%></td>
                <td align="left" ><%= hisName%>'s Income</td>
                <td align="right"><%= ExpenseInstanceTwo.getTotalIncomeFmtd()%></td>
            </tr>
            
            <tr><td align="left" ><%= herName%>'s Expenses</td>
                <td align="right"><%= ExpenseInstanceOne.getTotalExpensesFmtd()%></td>
                <td align="left" ><%= hisName%>'s Expenses</td>
                <td align="right"><%= ExpenseInstanceTwo.getTotalExpensesFmtd()%></td>
            </tr>

            <tr><td align="left" ><%= herName%>'s Savings</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getTotalIncome() - ExpenseInstanceOne.getTotalExpenses()))%></td>
                <td align="left" ><%= hisName%>'s Savings</td>
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
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getInterestIncome() + ExpenseInstanceTwo.getInterestIncome() + GainsInstanceOne.getInterestIncome() + GainsInstanceTwo.getInterestIncome()))%></td>
                <td align="left" >Electricity Bill</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getElectricityBill() + ExpenseInstanceTwo.getElectricityBill()))%></td>
            </tr>
                        
            <tr><td align="left" >Dividend Income</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getDividendIncome() + ExpenseInstanceTwo.getDividendIncome() + GainsInstanceOne.getDividendIncome() + GainsInstanceTwo.getDividendIncome()))%></td>
                <td align="left" >Amazon Purchases and Miscellaneous</td>
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
                <td align="left" >Car Maintenance and Travel Expenses</td>
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
                <td align="left" >Education, Laptop, Accessories</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Domestic Help</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getHousekeepingExpenses() + ExpenseInstanceTwo.getHousekeepingExpenses()))%></td>
            </tr>
            
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Home Loan EMIs</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI()))%></td>
            </tr>
			
			<tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Healthcare and Fitness</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getdHealthCareExpenses() + ExpenseInstanceTwo.getdHealthCareExpenses()))%></td>
            </tr>
			
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><b>Non Discretionary Spending</b></td>
                <td align="right"><%= rf.formattedRupee(ft.format(nonDiscretionaryExpenses))%>
                </td>
            </tr>      
			
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Home Improvement</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments()))%></td>
            </tr>
			
			<tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" >Books outside of Work</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getdLearningExpenses() + ExpenseInstanceTwo.getdLearningExpenses()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><b>Discretionary Spending</b></td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getDiscretionaryExpenses() + ExpenseInstanceTwo.getDiscretionaryExpenses()))%></td>
            </tr>
            
            <tr><td align="left" ><b>Total Income </b></td>
                <td align="right"><%= rf.formattedRupee(ft.format(
                    ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()
                ))
                    %></td>
                <td align="left" ><b>Total Expenses</b></td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getTotalExpenses() + ExpenseInstanceTwo.getTotalExpenses()))%>
                </td>
            </tr>
			
    </div>
</body>
</html>