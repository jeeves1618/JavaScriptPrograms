<%@page import="ViewServices.*"%>
<%@page import="CommonModules.*"%>
<%@page import="java.util.* "%>
<%@page import="java.text.* "%>
<%String operation = request.getParameter("operation");
int sNo = Integer.parseInt(request.getParameter("sNo"));
String totalAmountFmtd, datetime;
double twoAmount, oneAmount;
%>
<%String cancelURL;%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Regularly Traded Assets</title>
<link rel="stylesheet" href="FinancialManagementStyle.css">
</head>
<body>

    <%
	 ViewNetworthHistory viewNetworthHistory = new ViewNetworthHistory(); 
	 NetworthHistory NetworthHistoryEntry = viewNetworthHistory.getHistoryEntry(sNo);
	 ViewChartOfAccounts viewChartOfAccounts = new ViewChartOfAccounts();
	 String herName = viewChartOfAccounts.getHerName();
	 String hisName = viewChartOfAccounts.getHisName();
	 
	 %>
	     
	<main class="maincontent">
    <div>
        <h2 align=center>Manage Regularly Traded Assets</h2>
		<table border=1; align=center>
        <col width="260"> 
        <col width="260"> 
        <col width="260"> 
        <col width="260"> 
		<col width="260"> 
			<tr><td align="center"><a href="http://localhost:8090/FinancialStatements/" class="button button2">Balance Sheet</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp" class="button button2">Account Payables</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
				<td align="center" colspan="1"><a href="http://localhost:8090/FinancialStatements/ExpenseSplit.jsp" class="button button2">Expense Split</a></td>
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
            <col width="40">
            <col width="221"> 
            <col width="250"> 
            <col width="250"> 
            <col width="250"> 
			<col width="110">
            <tr><td align="center"><b>S.No</b></td>
				<td align="center"><b>Date</b></td>
                <td align="center" style="color: #0086b3;"><b><%= herName%></b></td>
				<td align="center" style="color: #cc0000;"><b><%= hisName%></b></td>
				<td align="center" style="color: #66cc00;"><b>Total</b></td>
				<td align="center"><b>Actions</b></td>
			</tr>
            
				<form action="http://localhost:8090/FinancialStatements/NetworthHistory.jsp?operation=<%= operation%>" method="POST">
				
				<%  if (operation.equals("Add Entry")) {
						sNo = sNo + 1;
						Date dNow = new Date();
						SimpleDateFormat ft = new SimpleDateFormat("dd/MM/yyyy");
						datetime = ft.format(dNow);
						twoAmount = 0;
						oneAmount = 0;
						totalAmountFmtd = "Rs.0.00";
						cancelURL = "http://localhost:8090/FinancialStatements/NetworthHistory.jsp?operation=View";
					 }  else if (operation.equals("Delete")){
						Date dNow = new Date();
						SimpleDateFormat ft = new SimpleDateFormat("dd/MM/yyyy");
						datetime = ft.format(dNow);
						twoAmount = 0;
						oneAmount = 0;
						totalAmountFmtd = "Rs.0.00";
						cancelURL = "http://localhost:8090/FinancialStatements/NetworthHistory.jsp?operation=View";
					 } else
					 {
						datetime = request.getParameter("dateTime");
						twoAmount = Double.parseDouble(request.getParameter("twoAmount"));
						oneAmount = Double.parseDouble(request.getParameter("oneAmount"));
						totalAmountFmtd = NetworthHistoryEntry.totalAmountFmtd;
						cancelURL = "http://localhost:8090/FinancialStatements/NetworthHistory.jsp?operation=View";
					 }				
				%>
				<tr><td align="center" ><input type="text" name="sNo" value="<%= sNo%>" readonly></td>
					<td align="center" ><input type="text" name="dateTime" value="<%= datetime%>" readonly></td>
					<td align="right" style="padding-left:10px; color: #0086b3;"><input type="number" name="twoAmount" id="twoAmount" value="<%= twoAmount%>"></td>
					<td align="right" style="padding-left:10px; color: #cc0000;"><input type="number" name="oneAmount" id="oneAmount" value="<%= oneAmount%>"></td>
					<td align="right" style="padding-left:10px; color: #66cc00;"><%= totalAmountFmtd%></td>
					<td align="center" style="padding-left:0px"><b><form action="http://localhost:8090/FinancialStatements/NetworthHistory.jsp?operation=<%= operation%>" method="POST"><input type="submit" value="<%= operation%>"></form></b></td>
				</tr>
				</form>
            
            </table>
			&nbsp;
			<div align="center"><form action="<%= cancelURL%>" method="POST"><input type="submit" value="Cancel"></form></div>
    </div>
	</main>
</body>
</html>