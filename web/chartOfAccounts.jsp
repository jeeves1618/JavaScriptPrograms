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
            <tr><td align="center"><a href="http://localhost:8090/FinancialStatements/">Balance Sheet</a></td>
                <td align="center"><a href="http://localhost:8090/FinancialStatements/IncomeStatement.jsp">Income Statement</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp">Cash Flow Statement</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp">Account Payables</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp">Account Receivables</a></td>
            </tr>
			<tr><td align="center" colspan="3"><a href="http://localhost:8090/FinancialStatements/FIRE.jsp">Financial Independence and Early Retirement</a></td>
				<td align="center" colspan="2"><a href="http://localhost:8090/FinancialStatements/ExpenseSplit.jsp">Expense Split</a></td>
			</tr>
			 <tr><td align="left" colspan="4" color="Ivory"><b>.</b>
            </tr>
        </table>
        <table border=1; align=center>
            <col width="225"> 
            <col width="580"> 
            <col width="237"> 
            <col width="238"> 
            <tr><td align="center"><b>Number</b></td>
                <td align="center"><b>Account Description</b></td>
				<td align="center"><b>Account Type</b></td>
				<td align="center"><b>Statement</b></td>
			</tr>
            
			<%for (chartOfAccountsIterator = 0; chartOfAccountsIterator < ChartOfAccounts.numofElements; chartOfAccountsIterator++){ %>
				<tr><td align="center" ><%= chartOfAccountsList[chartOfAccountsIterator].identificationNumber%></td>
					<td align="left" style="padding-left:10px"><%= chartOfAccountsList[chartOfAccountsIterator].itemDescription%></td>
					<td align="left" style="padding-left:10px"><%= chartOfAccountsList[chartOfAccountsIterator].typeAssetOrLiability%></td>
					<td align="left" style="padding-left:10px"><%= chartOfAccountsList[chartOfAccountsIterator].financialStatement%></td>
				</tr>
            <%}%>
            </table>
			
    </div>
</body>
</html>