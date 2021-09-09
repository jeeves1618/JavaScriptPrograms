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
</head>
<body>
    <%ViewChartOfAccounts viewChartOfAccounts = new ViewChartOfAccounts(); 
     ChartOfAccounts chartOfAccountsList = viewChartOfAccounts.getChartElement(chartNumber);%>
    
	<main class="maincontent">
    <div>
        <h2 align=center>Chart of Accounts</h2>
		<div class="topnav">
		<a href="http://localhost:8090/FinancialStatements/">Balance Sheet</a>
		<a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp">Account Payables</a>
		<a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp">Account Receivables</a>
		<a href="http://localhost:8090/FinancialStatements/admin.jsp?operation=View">Personalization</a>
		<a href="http://localhost:8090/FinancialStatements/NetworthHistory.jsp?operation=View">Tradeable Assets</a>
		<a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30">F.I.R.E</a>
		<a class="active" href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp">Chart of Accounts</a>
		<a href="http://localhost:8090/FinancialStatements/manageNLP.jsp">NLP Processor</a>
		<a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp">Cash Flow</a>
		<a href="http://localhost:8090/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown">Unknown Transactions</a>
		</div>
		&nbsp;
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
			<div align="center"><form action="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp" method="POST"><input type="submit" value="Cancel"></form></div>
    </div>
	</main>
</body>
</html>