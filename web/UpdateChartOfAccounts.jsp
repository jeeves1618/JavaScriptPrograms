<%@page import="ViewServices.*"%>
<%@page import="CommonModules.*"%>
<% int chartNumber = Integer.parseInt(request.getParameter("chartNumber"));%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chart of Accounts</title>
<link rel="stylesheet" href="FinancialManagementStyle.css">
</head>
<body>
    <%ViewChartOfAccounts viewChartOfAccounts = new ViewChartOfAccounts(); 
     ChartOfAccounts chartOfAccountsList = viewChartOfAccounts.getChartElement(chartNumber);%>
    
	<main class="maincontent">
    <div>
        <h2 align=center>Chart of Accounts</h2>
		<table border=1; align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260">
            <tr><td align="center"><a href="http://localhost:8090/FinancialStatements/" class="button button2">Balance Sheet</a></td>
                <td align="center"><a href="http://localhost:8090/FinancialStatements/NetworthHistory.jsp" class="button button2">Networth History</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp" class="button button2">Cash Flow Statement</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp" class="button button2">Account Payables</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
            </tr>
			<tr><td align="center" colspan="1"><a href="http://localhost:8090/FinancialStatements/manageNLP.jsp" class="button button2">NLP Tokens</a></td>
				<td align="center" colspan="2"><a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30" class="button button2">Financial Independence and Early Retirement</a></td>
				<td align="center" colspan="1"><a href="http://localhost:8090/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown" class="button button3">Unknown Transactions</a></td>
				<td align="center" colspan="1"><a href="http://localhost:8090/FinancialStatements/ExpenseSplit.jsp" class="button button2">Expense Split</a></td>
			</tr>
			 <tr><td align="left" colspan="5" color="Ivory"><b>&nbsp;</b>
            </tr>
        </table>
        <table class="class2"border=1; align=center>
            <col width="80"> 
            <col width="450"> 
            <col width="170"> 
            <col width="200"> 
			<col width="150"> 
			<col width="50">
			<col width="60">
            <tr><td align="center"><b>Number</b></td>
                <td align="center"><b>Account Description</b></td>
				<td align="center"><b>Account Type</b></td>
				<td align="center"><b>Statement</b></td>
				<td align="center"><b>Amount</b></td>
				<td align="center"><b>Liquid?</b></td>
				<td align="center"><b>Actions</b></td>
			</tr>
            
				<form action="http://localhost:8090/FinancialStatements/persistChartofAccounts.jsp?chartNumber=<%= chartOfAccountsList.identificationNumber%>" method="POST">
				<tr><td align="center" ><%= chartOfAccountsList.identificationNumber%></td>
					<td align="left" style="padding-left:10px"><input type="text" name="itemDescription" value="<%= chartOfAccountsList.itemDescription%>"></td>
					<td align="left" style="padding-left:10px"><%= chartOfAccountsList.typeAssetOrLiability%></td>
					<td align="left" style="padding-left:10px"><%= chartOfAccountsList.financialStatement%></td>
					<td align="right" style="padding-left:10px"><input type="number" name="cashValue" value="<%= chartOfAccountsList.cashValue%>"></td>
					<td align="left" style="padding-left:10px"><select name="isAssetLiquidInd" id="isAssetLiquidInd">
						<option value="Y">Yes</option>
						<option value="N">No</option>
						</select>
					<td align="center" style="padding-left:0px"><b><input type="submit" value="Save	"></b></td> 
				</tr>
				</form>
            
            </table>
			&nbsp;
			<div align="center"><a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp" class="button button2">Cancel</a></div>
    </div>
	</main>
</body>
</html>