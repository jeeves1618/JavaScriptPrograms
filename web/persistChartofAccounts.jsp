<%@page import="ViewServices.*"%>
<%@page import="CommonModules.*"%>
<%! int chartOfAccountsIterator; %>
<% int chartNumber = Integer.parseInt(request.getParameter("chartNumber"));%>
<% String itemDescription = request.getParameter("itemDescription");%>
<% double cashValue = Double.parseDouble(request.getParameter("cashValue"));%>
<% String isAssetLiquidInd = request.getParameter("isAssetLiquidInd");%>
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
	  ChartOfAccounts chartOfAccountsElement = viewChartOfAccounts.getChartElement(chartNumber);
	  chartOfAccountsElement.isAssetLiquidInd = "V";
	  viewChartOfAccounts.updateChartElement(chartNumber, itemDescription, cashValue, isAssetLiquidInd);
      ChartOfAccounts[] chartOfAccountsList = viewChartOfAccounts.getChartOfAccounts();%>	  
    
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
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp" class="button button2">Account Payables</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
				<td align="center" colspan="1"><a href="http://localhost:8090/FinancialStatements/admin.jsp?operation=View" class="button button2">Personalization</a></td>
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
        <table class="class2"border=1; align=center>
            <col width="80"> 
            <col width="470"> 
            <col width="180"> 
            <col width="210"> 
			<col width="150"> 
			<col width="50">
			<col width="110">
            <tr><td align="center"><b>Number</b></td>
                <td align="center"><b>Account Description</b></td>
				<td align="center"><b>Account Type</b></td>
				<td align="center"><b>Statement</b></td>
				<td align="center"><b>Amount</b></td>
				<td align="center"><b>Liquid?</b></td>
				<td align="center"><b>Actions</b></td>
			</tr>
            
			<%for (chartOfAccountsIterator = 0; chartOfAccountsIterator < ChartOfAccounts.numofElements; chartOfAccountsIterator++){ %>
				<tr><td align="center" ><%= chartOfAccountsList[chartOfAccountsIterator].identificationNumber%></td>
					<td align="left" style="padding-left:10px"><%= chartOfAccountsList[chartOfAccountsIterator].itemDescription%></td>
					<td align="left" style="padding-left:10px"><%= chartOfAccountsList[chartOfAccountsIterator].typeAssetOrLiability%></td>
					<td align="left" style="padding-left:10px"><%= chartOfAccountsList[chartOfAccountsIterator].financialStatement%></td>
					<td align="right" style="padding-left:10px"><%= chartOfAccountsList[chartOfAccountsIterator].cashValueFmtd%></td>
					<td align="left" style="padding-left:10px"><%= chartOfAccountsList[chartOfAccountsIterator].isAssetLiquidInd%></td>
					<td align="center" style="padding-left:0px"><b><form action="http://localhost:8090/FinancialStatements/UpdateChartOfAccounts.jsp?chartNumber=<%= chartOfAccountsList[chartOfAccountsIterator].identificationNumber%>" method="POST"><input type="submit" value="Update Amount"></form></b></td> 
				</tr>
            <%}%>
            </table>
    </div>
	</main>
</body>
</html>
