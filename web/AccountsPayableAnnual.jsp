<%@page import="IncomeStatement.*"%>
<%@page import="CommonModules.*"%>
<%@page import="PerformanceAnalyzer.*"%>
<%@page import="ViewServices.*"%>
<%@page import="java.text.*"%>
<%@ page import="com.google.gson.*"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
    <%ExpenseCalculator ExpenseInstanceOne = new ExpenseCalculator("Two", "Sal1");%>
    <%ExpenseCalculator ExpenseInstanceTwo = new ExpenseCalculator("One", "Sal1");%>
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
            background-color: FloralWhite;
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

    
    <script>
        var jsVariable='<%= (ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance())*100/(ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses())%>';
    </script>
    <div>
        <h2 align=center> Accounts Payables Yearly</h2>
		<table border=1; align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260">  
            <tr><td align="center"><a href="http://localhost:8080/FinancialStatements/" class="button button2">Balance Sheet</a></td>
                <td align="center"><a href="http://localhost:8080/FinancialStatements/NetworthHistory.jsp" class="button button2">Networth History</a></td>
                <td align="center" ><a href="http://localhost:8080/FinancialStatements/CashFlowStatement.jsp" class="button button2">Cash Flow Statement</td>
				<td align="center" ><a href="http://localhost:8080/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
                <td align="center"><a href="http://localhost:8080/FinancialStatements/chartOfAccounts.jsp" class="button button2">Chart of Accounts</a></td>
            </tr>
			<tr><td align="center" colspan="3"><a href="http://localhost:8080/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30" class="button button2">Financial Independence and Early Retirement</a></td>
				<td align="center" colspan="2"><a href="http://localhost:8080/FinancialStatements/ExpenseSplit.jsp" class="button button2">Expense Split</a></td>
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
			<a href="http://localhost:8080/FinancialStatements/AccountsPayable.jsp" class="button button2">Monthly View</button></td></tr>
            <tr><td align="center" colspan="2"><b><%= herName%> - Annual Summary</b></td>
                <td align="center" colspan="2"><b><%= hisName%> - Annual Summary</b></td></tr>
                        
            <tr><td align="left" ><%= herName%>'s Income</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getTotalIncome() * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><%= hisName%>'s Income</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceTwo.getTotalIncome() * ExpenseInstanceTwo.getMonthsBetween()))%></td>
            </tr>
            
            <tr><td align="left" ><%= herName%>'s Expenses</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getTotalExpenses() * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><%= hisName%>'s Expenses</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceTwo.getTotalExpenses() * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

            <tr><td align="left" ><%= herName%>'s Savings</td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getTotalIncome() - ExpenseInstanceOne.getTotalExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><%= hisName%>'s Savings</td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceTwo.getTotalIncome() - ExpenseInstanceTwo.getTotalExpenses()) * ExpenseInstanceTwo.getMonthsBetween()))%></td>
            </tr>

            <tr><td align="center" colspan="2"><b>Annual Income Split</b></td>
                <td align="center" colspan="2"><b>Annual Expense Split</b></td></tr>
                        
            <tr><td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Salary">Salary Income</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getSalaryIncome() + ExpenseInstanceTwo.getSalaryIncome()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Apartment%20Maintenance">Apartment Maintenance</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

            <tr><td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Interest%20Income">Interest Income</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getInterestIncome() + ExpenseInstanceTwo.getInterestIncome() + GainsInstanceOne.getInterestIncome() + GainsInstanceTwo.getInterestIncome()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Electricity%20Expenses">Electricity Bill</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getElectricityBill() + ExpenseInstanceTwo.getElectricityBill()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
                        
            <tr><td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Dividend%20Income">Dividend Income</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getDividendIncome() + ExpenseInstanceTwo.getDividendIncome()+ GainsInstanceOne.getDividendIncome() + GainsInstanceTwo.getDividendIncome()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Miscellaneous">Amazon Purchases and Miscellaneous</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getCreditCardBill() + ExpenseInstanceTwo.getCreditCardBill()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

            <tr><td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Rental%20Income">Rental Income</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getRentalIncome() + ExpenseInstanceTwo.getRentalIncome()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Brokerage%20Maintenance">Trading Expenses</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getBrokerageMaintenance() + ExpenseInstanceTwo.getBrokerageMaintenance())* ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
                        
            <tr><td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Sale%20	Proceeds">Maturity of Savings</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getSaleProceeds() + ExpenseInstanceTwo.getSaleProceeds()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Insurance">Home, Car, Personal Insurance</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getHomeInsurance() + ExpenseInstanceTwo.getHomeInsurance()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

            <tr><td align="left" >Capital Gains</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getCapitalGains() * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Cash%20Withdrawals">Cash Withdrawals</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getCashWithdrawals() + ExpenseInstanceTwo.getCashWithdrawals()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
                        
            <tr><td align="left" >Monetary Gifts</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getMonetaryGifts() * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Groceries">Groceries</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getGroceryExpenses() + ExpenseInstanceTwo.getGroceryExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Travel%20Expenses">Car Maintenance and Travel Expenses</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getTravelExpense() + ExpenseInstanceTwo.getTravelExpense()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
                        
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Family">Extended Family Care</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getFamilyExpenses() + ExpenseInstanceTwo.getFamilyExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Shopping%20and%20Eatout">Shopping and Eat Outs</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getShoppingExpense() + ExpenseInstanceTwo.getShoppingExpense()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
                        
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Entertainment">Entertainment and Connectivity</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
			
			<tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Education">Education, Laptop, Accessories</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=House%20Keeping">Domestic Help</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getHousekeepingExpenses() + ExpenseInstanceTwo.getHousekeepingExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
                        
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Investments">Home Improvement</a></td></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

			<tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Healthcare%20and%20Fitness">Healthcare and Fitness</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getdHealthCareExpenses() + ExpenseInstanceTwo.getdHealthCareExpenses() 
				 + ExpenseInstanceOne.getdLearningExpenses() + ExpenseInstanceTwo.getdLearningExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
			<tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><b>Non Discretionary Spending</b></td>
                <td align="right"><%= rf.formattedRupee(ft.format(nonDiscretionaryExpenses * ExpenseInstanceOne.getMonthsBetween()))%>
                </td>
            </tr>
						
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Monthly%20EMI">Home Loan EMIs</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
			
			<tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8080/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Discretionary%20Learning">Books outside of Work</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getdLearningExpenses() + ExpenseInstanceTwo.getdLearningExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
			
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><b>Discretionary Spending</b></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getDiscretionaryExpenses() + ExpenseInstanceTwo.getDiscretionaryExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
            
            
            <tr><td align="left" ><b>Total Income </b></td>
                <td align="right"><%= rf.formattedRupee(ft.format((
                    ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()) * ExpenseInstanceOne.getMonthsBetween()
                ))
                    %></td>
                <td align="left" ><b>Total Expenses</b></td>
                <td align="right"><%= rf.formattedRupee(ft.format((
                     ExpenseInstanceOne.getTotalExpenses() + ExpenseInstanceTwo.getTotalExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%>
                </td>
            </tr>
			</table>
    </div>
</body>
</html>