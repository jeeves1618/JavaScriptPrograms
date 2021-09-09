<%@page import="IncomeStatement.*"%>
<%@page import="BalanceSheet.*"%>
<%@page import="CommonModules.*"%>
<%@page import="ViewServices.*"%>
<%@page import="java.text.*"%>
<%@ page import="com.google.gson.*"%>
<%@ page import="java.util.*" %>
<%@page import="admin.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
	

    <%buildBalanceSheet totalInc = new buildBalanceSheet(0, 0);%>
	
	<%ExpenseCalculator ExpenseInstanceOne = new ExpenseCalculator("Two", "Sal1");%>
    <%ExpenseCalculator ExpenseInstanceTwo = new ExpenseCalculator("One", "Sal1");%>
    <%String currencyFormat = new CurrencyCustomization().getCurrencyFormat();
	  String currencyPrefix = currencyFormat.substring(0, currencyFormat.indexOf(" ")).concat(" ")																;
	  DecimalFormat ft = new DecimalFormat(currencyFormat);%>
    <%DecimalFormat pc = new DecimalFormat("##,##,##0.00 %");%>
    <%RupeeFormatter rf = new RupeeFormatter();%>
    <%double nonDiscretionaryExpenses = (ExpenseInstanceOne.getNonDiscretionaryExpenses() + ExpenseInstanceTwo.getNonDiscretionaryExpenses())*ExpenseInstanceTwo.getMonthsBetween();%>
 <%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("label", "Liquid Assets"); map.put("y", totalInc.chartOfAccountsList[0].cashValue + totalInc.chartOfAccountsList[30].cashValue + totalInc.chartOfAccountsList[1].cashValue); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Accounts Receivables"); map.put("y", totalInc.chartOfAccountsList[2].cashValue + totalInc.chartOfAccountsList[3].cashValue + totalInc.chartOfAccountsList[4].cashValue + totalInc.chartOfAccountsList[5].cashValue); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Fixed Assets"); map.put("y", totalInc.chartOfAccountsList[6].cashValue + totalInc.chartOfAccountsList[7].cashValue + totalInc.chartOfAccountsList[8].cashValue + totalInc.chartOfAccountsList[9].cashValue); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Other Assets"); map.put("y", totalInc.chartOfAccountsList[11].cashValue + totalInc.chartOfAccountsList[12].cashValue + totalInc.chartOfAccountsList[13].cashValue); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Total Assets"); map.put("isIntermediateSum", true); map.put("color", "#55646e"); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Accrued Expenses"); map.put("y", -totalInc.chartOfAccountsList[14].cashValue); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Accounts Payables"); map.put("y", -1 * (totalInc.chartOfAccountsList[15].cashValue + totalInc.chartOfAccountsList[16].cashValue + totalInc.chartOfAccountsList[17].cashValue + totalInc.chartOfAccountsList[18].cashValue)); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Long Term Debts"); map.put("y", -1 * (totalInc.chartOfAccountsList[20].cashValue + totalInc.chartOfAccountsList[21].cashValue + totalInc.chartOfAccountsList[22].cashValue + totalInc.chartOfAccountsList[23].cashValue)); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Networth"); map.put("isCumulativeSum", true); map.put("color", "#55646e"); list.add(map);
 
String dataPoints = gsonObj.toJson(list);
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Personal Financial Statement</title>
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {	
	animationEnabled: true,
	title:{
		text: " "
	},
	axisX:{
		labelMaxWidth: 75
	},
	axisY: {
		prefix: "<%out.print(currencyPrefix);%>",
		includeZero: true
	},	
	data: [{
		type: "waterfall",
		yValueFormatString: "<%out.print(currencyFormat);%>" ,
		indexLabel: "{y}",
		risingColor: "#50cdc8",
		fallingColor: "#ff6969",
		dataPoints: <%out.print(dataPoints);%>
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
		/*
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
		*/
		.button {
				  border: none;
				  color: white;
				  padding: 2px 2px;
				  text-align: center;
				  text-decoration: solid;
				  display: inline-block;
				  font-size: medium;
				  font: bold;
				  margin: 0px 0px;
				  width: 90%;
				  transition-duration: 0.4s;
				  cursor: pointer;
				 }
		.button2 {
					background-color: Snow;
					color: black;
					border: 2px solid #008CBA;
				}
		.button3 {
					background-color: Snow;
					color: red;
					border: 2px solid #008CBA;
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
    <div>
        <h2 align=center>Personal Balance Sheet</h2>
		<div class="topnav">
		<a class="active" href="http://localhost:8090/FinancialStatements/">Balance Sheet</a>
		<a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp">Account Payables</a>
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
		<div id="chartContainer" style="height: 370px; width: 100%;"></div>
		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		<div id="blankLine" style="height: 25px; width: 100%;"></div>
        <table border=1; align=center>
            <col width="470"> 
            <col width="180"> 
            <col width="470"> 
            <col width="180"> 
            <tr><td align="center" colspan="2"><b>Asset</b></td>
                <td align="center" colspan="2"><b>Liability</b></td></tr>
				
            <tr><td align="left" colspan="2"><b>Liquid Assets</b></td>
                <td align="left" colspan="2"><b>Accrued Expenses</b></td></tr>
            
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[0].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[0].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[14].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[14].cashValueFmtd%></td>
            </tr>
            
			<tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[30].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[30].cashValueFmtd%></td>
                <td align="left" colspan="2"><b></b></td>
            </tr>
			
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[1].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[1].cashValueFmtd%></td>
                <td align="left" colspan="2"></td>
            </tr>
                        
            <tr><td align="left" colspan="2"><b><%= totalInc.chartOfAccountsList[4].subType%></b></td>
                <td align="left" colspan="2"><b><a href="http://localhost:8090/FinancialStatements/AccountsPayableAnnual.jsp"><%= totalInc.chartOfAccountsList[18].subType%></a></b></td>
            </tr>
            
			<tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[2].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[2].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[15].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[15].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[3].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[3].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[16].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[16].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[4].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[4].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[17].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[17].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[5].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[5].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[18].itemDescription%></td>
                <td align="right"><%= rf.formattedRupee(ft.format(totalInc.chartOfAccountsList[18].cashValue))%></td>
            </tr>
            
            <tr><td align="left" colspan="2"></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[19].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[19].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" colspan="1"><b><%= totalInc.chartOfAccountsList[57].subType%></b></td>
                <td align="right" colspan="1"><%= totalInc.chartOfAccountsList[57].cashValueFmtd%></td>
                <td align="left" colspan="1"><b><%= totalInc.chartOfAccountsList[31].subType%></b></td>
                <td align="right" colspan="1"><%= totalInc.chartOfAccountsList[31].cashValueFmtd%></td>
            </tr>

            <tr><td align="left" colspan="2"><b><%= totalInc.chartOfAccountsList[6].subType%></b>
                <td align="left" colspan="2"><b><%= totalInc.chartOfAccountsList[20].subType%></b>
            </tr>

            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[6].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[6].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[20].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[20].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[7].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[7].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[21].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[21].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[8].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[8].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[22].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[22].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[9].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[9].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[23].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[23].cashValueFmtd%></td>
            </tr>

            <tr><td align="left" colspan="2"><b><%= totalInc.chartOfAccountsList[10].subType%></b></td>
                <td align="left" colspan="2"></td>
            </tr>

            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[11].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[11].cashValueFmtd%></td>
                <td align="left" colspan="2"></td>
            </tr>

            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[12].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[12].cashValueFmtd%></td>
                <td align="left" colspan="2"></td>
            </tr>

            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[13].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[13].cashValueFmtd%></td>
                <td align="left" colspan="2"></td>
            </tr>

            <tr><td align="left" ><b><%= totalInc.chartOfAccountsList[33].itemDescription%></b></td>
                <td align="right"><%= totalInc.chartOfAccountsList[33].cashValueFmtd%></td>
                <td align="left" ><b><%= totalInc.chartOfAccountsList[32].subType%></b></td>
                <td align="right"><%= totalInc.chartOfAccountsList[32].cashValueFmtd%></td>
            </tr>

            <tr><td align="left" ><b>Total Assets</b></td>
                <td align="right"><%= totalInc.getTotalAssetsFmtd()%></td>
                <td align="left" ><b>Total Liabilities</b></td>
                <td align="right"><%= totalInc.getTotalLiabilitiesFmtd()%></td>
            </tr>

            <tr><td align="left" colspan="2"></td>
                <td align="left" ><b>Total Equity</b></td>
                <td align="right"><%= totalInc.getNetWorthFmtd()%></td>
            </tr>
			<tr>
                <td align="center" colspan="4"><b>Solvent till <%= totalInc.getSurvivalDateFmtd()%></b></td>
            </tr>
		</table>	
		
    </div>
</body>
</html>