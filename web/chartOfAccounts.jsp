<%@page import="ViewServices.*"%>
<%@page import="CommonModules.*"%>
<%! int chartOfAccountsIterator; %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chart of Accounts</title>
</head>
<body>

    <style type="text/css">
        body {
            font-family: 'Courier New', Courier, monospace;
            font-size: medium;
            font: outline;
            margin: 1pt;
            background-color: Ivory;
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

    <%ViewChartOfAccounts viewChartOfAccounts = new ViewChartOfAccounts(); 
     ChartOfAccounts[] chartOfAccountsList = viewChartOfAccounts.getChartOfAccounts();%>
    
    <div>
        <h2 align=center>Chart of Accounts</h2>
		<table border=1; align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260">
            <tr><td align="center"><a href="http://localhost:8090/FinancialStatements/" class="button button2">Balance Sheet</a></td>
                <td align="center"><a href="http://localhost:8090/FinancialStatements/IncomeStatement.jsp" class="button button2">Income Statement</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp" class="button button2">Cash Flow Statement</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp" class="button button2">Account Payables</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
            </tr>
			<tr><td align="center" colspan="3"><a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30" class="button button2">Financial Independence and Early Retirement</a></td>
				<td align="center" colspan="2"><a href="http://localhost:8090/FinancialStatements/ExpenseSplit.jsp" class="button button2">Expense Split</a></td>
			</tr>
			 <tr><td align="left" colspan="4" color="Ivory"><b>.</b>
            </tr>
        </table>
        <table border=1; align=center>
            <col width="221"> 
            <col width="540"> 
            <col width="237"> 
            <col width="230"> 
			<col width="48">
            <tr><td align="center"><b>Number</b></td>
                <td align="center"><b>Account Description</b></td>
				<td align="center"><b>Account Type</b></td>
				<td align="center"><b>Statement</b></td>
				<td align="center"><b>Liquid?</b></td>
			</tr>
            
			<%for (chartOfAccountsIterator = 0; chartOfAccountsIterator < ChartOfAccounts.numofElements; chartOfAccountsIterator++){ %>
				<tr><td align="center" ><%= chartOfAccountsList[chartOfAccountsIterator].identificationNumber%></td>
					<td align="left" style="padding-left:10px"><%= chartOfAccountsList[chartOfAccountsIterator].itemDescription%></td>
					<td align="left" style="padding-left:10px"><%= chartOfAccountsList[chartOfAccountsIterator].typeAssetOrLiability%></td>
					<td align="left" style="padding-left:10px"><%= chartOfAccountsList[chartOfAccountsIterator].financialStatement%></td>
					<td align="left" style="padding-left:10px"><%= chartOfAccountsList[chartOfAccountsIterator].isAssetLiquidInd%></td>
				</tr>
            <%}%>
            </table>
			
    </div>
</body>
</html>