<%@page import="ViewServices.*"%>
<%@page import="CommonModules.*"%>	
<%! int networthHistoryIterator; %>
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
				  width: 90%;
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
	<%ViewNetworthHistory viewNetworthHistory = new ViewNetworthHistory(); 
     NetworthHistory[] NetworthHistoryList = viewNetworthHistory.getNetworthHistory();%>   
   
    <div>
        <h2 align=center>Networth History</h2>
		<div class="topnav">
		<a href="http://localhost:8080/FinancialStatements/">Balance Sheet</a>
		<a href="http://localhost:8080/FinancialStatements/AccountsPayable.jsp">Payables</a>
		<a class="active" href="http://localhost:8080/FinancialStatements/AccountsReceivable.jsp">Receivables</a>
		<a href="http://localhost:8080/FinancialStatements/admin.jsp?operation=View">Personalization</a>
		<a href="http://localhost:8080/FinancialStatements/NetworthHistory.jsp?operation=View">Tradeables</a>
		<a href="http://localhost:8080/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30">F.I.R.E</a>
		<a href="http://localhost:8080/FinancialStatements/chartOfAccounts.jsp">Chart of Accounts</a>
		<a href="http://localhost:8080/FinancialStatements/manageNLP.jsp">NLP</a>
		<a href="http://localhost:8080/FinancialStatements/CashFlowStatement.jsp">Cash Flow</a>
		<a href="http://localhost:8080/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown">Unknown Entries</a>
		</div>
		&nbsp;
        <table class="class2"border=1; align=center>
            <col width="221"> 
            <col width="250"> 
            <col width="250"> 
            <col width="250"> 
            <tr><td align="center"><b>Date</b></td>
                <td align="center"><b><%= viewNetworthHistory.getHerName%> Amount</b></td>
				<td align="center"><b><%= viewNetworthHistory.getHisName%> Amount</b></td>
				<td align="center"><b>Total Amount</b></td>
			</tr>
            
			<%for (networthHistoryIterator = 0; networthHistoryIterator < NetworthHistory.numofElements; networthHistoryIterator++){ %>
				<tr><td align="center" ><%= NetworthHistoryList[networthHistoryIterator].valueDate%></td>
					<td align="right" style="padding-left:10px"><%= NetworthHistoryList[networthHistoryIterator].twoAmountFmtd%></td>
					<td align="right" style="padding-left:10px"><%= NetworthHistoryList[networthHistoryIterator].oneAmountFmtd%></td>
					<td align="right" style="padding-left:10px"><%= NetworthHistoryList[networthHistoryIterator].totalAmountFmtd%></td>
				</tr>
            <%}%>
            </table>
    </div>	
	
</body>
</html>