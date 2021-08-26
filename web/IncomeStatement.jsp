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
	
	<%ViewNetworthHistory viewNetworthHistory = new ViewNetworthHistory(); 
     NetworthHistory[] NetworthHistoryList = viewNetworthHistory.getNetworthHistory();%>   
   
    <div>
        <h2 align=center>Networth History</h2>
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
        <table border=1; align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260">  
            <tr><td align="center"><a href="http://localhost:8080/FinancialStatements/" class="button button2">Balance Sheet</a></td>
				<td align="center" ><a href="http://localhost:8080/FinancialStatements/CashFlowStatement.jsp" class="button button2">Cash Flow Statement</a></td>
                <td align="center" ><a href="http://localhost:8080/FinancialStatements/AccountsPayable.jsp" class="button button2">Account Payables</a></td>
				<td align="center" ><a href="http://localhost:8080/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
                <td align="center"><a href="http://localhost:8080/FinancialStatements/chartOfAccounts.jsp" class="button button2">Chart of Accounts</a></td>
            </tr>
			<tr><td align="center" colspan="1"><a href="http://localhost:8080/FinancialStatements/manageNLP.jsp" class="button button2">NLP Tokens</a></td>
				<td align="center" colspan="3"><a href="http://localhost:8080/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30" class="button button2">Financial Independence and Early Retirement</a></td>
				<td align="center" colspan="1"><a href="http://localhost:8080/FinancialStatements/ExpenseSplit.jsp" class="button button2">Expense Split</a></td>
			</tr>
        </table>
    </div>	
	
</body>
</html>