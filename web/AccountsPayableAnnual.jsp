<%@page import="IncomeStatement.*"%>
<%@page import="CommonModules.*"%>
<%@page import="PerformanceAnalyzer.*"%>
<%@page import="admin.*"%>
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
    <%String currencyFormat = new CurrencyCustomization().getCurrencyFormat();
	  DecimalFormat ft = new DecimalFormat(currencyFormat);%>
    <%DecimalFormat pc = new DecimalFormat("##,##,##0.00 %");%>
    <%RupeeFormatter rf = new RupeeFormatter();%>
    <%double nonDiscretionaryExpenses = ExpenseInstanceOne.getNonDiscretionaryExpenses() + ExpenseInstanceTwo.getNonDiscretionaryExpenses();%>
	<%double nonDiscretionaryNonEMIExpenses = nonDiscretionaryExpenses - ExpenseInstanceOne.getMonthlyEMI() -ExpenseInstanceTwo.getMonthlyEMI();%>
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
	<style>
body {
  margin: auto;
  width: 95%;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #04AA6D;
  color: white;
}
topnav{
  text-align: center;
}
topnav ul{
  display: inline-block;
}
</style>
    
    <script>
        var jsVariable='<%= (ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance())*100/(ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses())%>';
    </script>
    <div>
        <h2 align=center> Accounts Payables Yearly</h2>
		<div class="topnav">
		<a href="http://localhost:8090/FinancialStatements/">Balance Sheet</a>
		<a class="active" href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp">Account Payables</a>
		<a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp">Account Receivables</a>
		<a href="http://localhost:8090/FinancialStatements/admin.jsp?operation=View">Personalization</a>
		<a href="http://localhost:8090/FinancialStatements/NetworthHistory.jsp?operation=View">Tradeable Assets</a>
		<a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30">F.I.R.E</a>
		<a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp">Chart of Accounts</a>
		<a href="http://localhost:8090/FinancialStatements/manageNLP.jsp">NLP Processor</a>
		<a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp">Cash Flow</a>
		<a href="http://localhost:8090/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown">Unknown Transactions</a>
		</div>
		&nbsp;

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
			<a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp" class="button button1">Monthly View</button></td></tr>
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
                        
            <tr><td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Salary">Salary Income</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getSalaryIncome() + ExpenseInstanceTwo.getSalaryIncome()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Apartment%20Maintenance">Apartment Maintenance</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

            <tr><td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Interest%20Income">Interest Income</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getInterestIncome() + ExpenseInstanceTwo.getInterestIncome() + GainsInstanceOne.getInterestIncome() + GainsInstanceTwo.getInterestIncome()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Electricity%20Expenses">Electricity Bill</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getElectricityBill() + ExpenseInstanceTwo.getElectricityBill()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
                        
            <tr><td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Dividend%20Income">Dividend Income</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getDividendIncome() + ExpenseInstanceTwo.getDividendIncome()+ GainsInstanceOne.getDividendIncome() + GainsInstanceTwo.getDividendIncome()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Miscellaneous">Amazon Purchases and Miscellaneous</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getCreditCardBill() + ExpenseInstanceTwo.getCreditCardBill()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

            <tr><td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Rental%20Income">Rental Income</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getRentalIncome() + ExpenseInstanceTwo.getRentalIncome()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Brokerage%20Maintenance">Trading Expenses</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getBrokerageMaintenance() + ExpenseInstanceTwo.getBrokerageMaintenance())* ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
                        
            <tr><td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Sale%20	Proceeds">Maturity of Savings</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getSaleProceeds() + ExpenseInstanceTwo.getSaleProceeds()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Insurance">Home, Car, Personal Insurance</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getHomeInsurance() + ExpenseInstanceTwo.getHomeInsurance()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

            <tr><td align="left" >Capital Gains</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getCapitalGains() * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Cash%20Withdrawals">Cash Withdrawals</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getCashWithdrawals() + ExpenseInstanceTwo.getCashWithdrawals()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
                        
            <tr><td align="left" >Monetary Gifts</td>
                <td align="right"><%= rf.formattedRupee(ft.format(ExpenseInstanceOne.getMonetaryGifts() * ExpenseInstanceOne.getMonthsBetween()))%></td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Groceries">Groceries</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getGroceryExpenses() + ExpenseInstanceTwo.getGroceryExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Travel%20Expenses">Car Maintenance and Travel Expenses</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getTravelExpense() + ExpenseInstanceTwo.getTravelExpense()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
                        
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Family">Extended Family Care</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getFamilyExpenses() + ExpenseInstanceTwo.getFamilyExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Shopping%20and%20Eatout">Shopping and Eat Outs</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getShoppingExpense() + ExpenseInstanceTwo.getShoppingExpense()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
                        
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Entertainment">Entertainment and Connectivity</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
			
			<tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Education">Education, Laptop, Accessories</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=House%20Keeping">Domestic Help</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getHousekeepingExpenses() + ExpenseInstanceTwo.getHousekeepingExpenses()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
                        
            <tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Monthly%20EMI">Home Loan EMIs</a></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>

			<tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Healthcare%20and%20Fitness">Healthcare and Fitness</a></td>
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
				<td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Investments">Home Improvement</a></td></td>
                <td align="right"><%= rf.formattedRupee(ft.format((ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments()) * ExpenseInstanceOne.getMonthsBetween()))%></td>
            </tr>
			
			<tr><td align="left" > </td>
                <td align="right"> </td>
                <td align="left" ><a href="http://localhost:8090/FinancialStatements/ViewPayablesDrilldown.jsp?entry_category=Discretionary%20Learning">Books outside of Work</a></td>
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
			&nbsp;
			<h2 align=center>Expense Split</h2>
			&nbsp;
			<table border=1; align=center>   
            <col width="572"> 
            <col width="80">
			<col width="572"> 
            <col width="80">
            <tr><td align="center" colspan="2"><b>Non Discretionary Expense Split</b></td> 
			    <td align="center" colspan="2"><b>Non Discretionary Non EMI Split</b></td></tr>
            <tr>
                <td align="left">Apartment Maintenance</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Apartment Maintenance</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Electricity Bill</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getElectricityBill() + ExpenseInstanceTwo.getElectricityBill())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Electricity Bill</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getElectricityBill() + ExpenseInstanceTwo.getElectricityBill())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Miscellaneous</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getCreditCardBill() + ExpenseInstanceTwo.getCreditCardBill())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Miscellaneous</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getCreditCardBill() + ExpenseInstanceTwo.getCreditCardBill())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Trading Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getBrokerageMaintenance() + ExpenseInstanceTwo.getBrokerageMaintenance())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Trading Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getBrokerageMaintenance() + ExpenseInstanceTwo.getBrokerageMaintenance())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            <tr>
                <td align="left">Insurance</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getHomeInsurance() + ExpenseInstanceTwo.getHomeInsurance())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Insurance</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getHomeInsurance() + ExpenseInstanceTwo.getHomeInsurance())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Cash Withdrawals</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getCashWithdrawals() + ExpenseInstanceTwo.getCashWithdrawals())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Cash Withdrawals</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getCashWithdrawals() + ExpenseInstanceTwo.getCashWithdrawals())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>

            <tr>
                <td align="left">Groceries</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getGroceryExpenses() + ExpenseInstanceTwo.getGroceryExpenses())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Groceries</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getGroceryExpenses() + ExpenseInstanceTwo.getGroceryExpenses())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Travel Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTravelExpense() + ExpenseInstanceTwo.getTravelExpense())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Travel Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTravelExpense() + ExpenseInstanceTwo.getTravelExpense())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
			
			<tr>
                <td align="left">Education Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Education Expenses</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
			
            <tr>
                <td align="left">Extended Family</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getFamilyExpenses() + ExpenseInstanceTwo.getFamilyExpenses())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Extended Family</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getFamilyExpenses() + ExpenseInstanceTwo.getFamilyExpenses())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Shopping Eat Outs</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getShoppingExpense() + ExpenseInstanceTwo.getShoppingExpense())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Shopping Eat Outs</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getShoppingExpense() + ExpenseInstanceTwo.getShoppingExpense())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>

            <tr>
                <td align="left">Entertainment</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Entertainment</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Domestic Help</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getHousekeepingExpenses() + ExpenseInstanceTwo.getHousekeepingExpenses())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="left">Domestic Help</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getHousekeepingExpenses() + ExpenseInstanceTwo.getHousekeepingExpenses())/
                    (nonDiscretionaryNonEMIExpenses))%></td>
            </tr>
            
            <tr>
                <td align="left">Home Loan EMIs</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI())/
                    (nonDiscretionaryExpenses))%></td>
				<td align="center" colspan="2">&nbsp</td>
            </tr>
            
            <tr><td align="center" colspan="4"><b>Expenses - Key Ratios</b></td></tr>            
            
            <tr>
                <td align="left">Non Discretionary Vs Expense</td>
                <td align="right"><%= pc.format((nonDiscretionaryExpenses)/
                    (ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses()))%></td>
				<td align="left">Non EMI Vs Expense</td>
                <td align="right"><%= pc.format((nonDiscretionaryNonEMIExpenses)/
                    (ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses()))%></td>
            </tr>
            <tr>
                <td align="left">Non Discretionary Vs Income</td>
                <td align="right"><%= pc.format(nonDiscretionaryExpenses/
                    (ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()))%></td>
				<td align="left">Non EMI Vs Income</td>
                <td align="right"><%= pc.format(nonDiscretionaryNonEMIExpenses/
                    (ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()))%></td>
            </tr>
            
            <tr>
                <td align="left">Discretionary Vs Expense</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments())/
                    (ExpenseInstanceTwo.getTotalExpenses()+ExpenseInstanceOne.getTotalExpenses()))%></td>
				<td align="center" colspan="2">&nbsp</td>
            </tr>

            <tr>
                <td align="left">Discretionary vs Income</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTotalInvestments() + ExpenseInstanceTwo.getTotalInvestments())/
                    (ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()))%></td>
				<td align="center" colspan="2">&nbsp</td>
            </tr>
            
            <tr>
                <td align="left">Expenses vs Income</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTotalExpenses() + ExpenseInstanceTwo.getTotalExpenses())/
                    (ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()))%></td>
				<td align="center" colspan="2">&nbsp</td>
            </tr>

            <tr>
                <td align="left">Savings vs Income</td>
                <td align="right"><%= pc.format((ExpenseInstanceOne.getTotalSavings() + ExpenseInstanceTwo.getTotalSavings())/
                    (ExpenseInstanceOne.getTotalIncome() + ExpenseInstanceTwo.getTotalIncome()))%></td>
				<td align="center" colspan="2">&nbsp</td>
            </tr>
            
        </table>
    </div>
</body>
</html>