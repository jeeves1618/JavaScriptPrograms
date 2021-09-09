<%@page import="ViewServices.*"%>
<%@page import="CommonModules.*"%>
<%@page import="java.text.* "%>
<%@page import="admin.*"%>
<%! int entrySerialNumber; %>
<%! double withdrawalAmount; %>
<%! double depositAmount; %>
<%! String entryCategory; %>
<%@page import="java.util.ListIterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Unknown Transactions</title>
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
	<% entryCategory = request.getParameter("entry_category");%>
    <%ViewPayablesDrilldown viewPayablesDrilldown = new ViewPayablesDrilldown(entryCategory);
      ListIterator<AccountStatement> requestIterator = viewPayablesDrilldown.getPayables().listIterator();
	  String currencyFormat = new CurrencyCustomization().getCurrencyFormat();
	  DecimalFormat ft = new DecimalFormat(currencyFormat);
      RupeeFormatter rf = new RupeeFormatter();
	  AccountStatement temp;
	  entrySerialNumber = 1;
	  withdrawalAmount = 0;
	  depositAmount = 0;
	  
	  ViewNaturalLanguageProcessor NLP = new ViewNaturalLanguageProcessor();
	  NaturalLanguageProcessor N = NLP.getTokenEntry(9999999);%>
    
    <div>
        <h2 align=center><%= entryCategory%> Transactions</h2>
		<div class="topnav">
		<a href="http://localhost:8090/FinancialStatements/">Balance Sheet</a>
		<a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp">Account Payables</a>
		<a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp">Account Receivables</a>
		<a href="http://localhost:8090/FinancialStatements/admin.jsp?operation=View">Personalization</a>
		<a href="http://localhost:8090/FinancialStatements/NetworthHistory.jsp?operation=View">Tradeable Assets</a>
		<a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30">F.I.R.E</a>
		<a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp">Chart of Accounts</a>
		<a href="http://localhost:8090/FinancialStatements/manageNLP.jsp">NLP Processor</a>
		<a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp">Cash Flow</a>
		<a class="active" href="http://localhost:8090/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown">Unknown Transactions</a>
		</div>
		&nbsp;
        <table border=1; align=center>
            <col width="50"> 
            <col width="150"> 
            <col width="600"> 
            <col width="175"> 
			<col width="175"> 
			<col width="150"> 
            <tr><td align="center"><b>S.No</b></td>
                <td align="center"><b>Transaction Date</b></td>
				<td align="center"><b>Transaction Remarks</b></td>
				<td align="center"><b>Deposit Amount</b></td>
				<td align="center"><b>Withdrawal Amount</b></td>
				<td align="center"><b>Actions</b></td>
			</tr>
            
			<%while (requestIterator.hasNext()) {
            temp = requestIterator.next(); %>
				<tr><td align="center" ><%= entrySerialNumber%></td>
					<td align="left" style="padding-left:10px"><%= temp.transactionDate%></td>
					<td align="left" style="padding-left:10px" ><%= temp.transactionRemarks%></td>
					<td align="right" style="padding-left:10px"><%= rf.formattedRupee(ft.format(temp.depositAmount))%></td>
					<td align="right" style="padding-left:10px"><%= rf.formattedRupee(ft.format(temp.withdrawalAmount))%></td>
									  
					<td align="center"><form action="http://localhost:8090/FinancialStatements/EditNLPToken.jsp?tokenNumber=<%=N.identificationNumber%>&operation=Categorize&txnRemarks=<%= temp.transactionRemarks%>" method="POST"><input type="submit" value="Categorize Entry"></form></td>
				</tr>
				<%entrySerialNumber = entrySerialNumber + 1;
				  depositAmount = depositAmount + temp.depositAmount;
				  withdrawalAmount = withdrawalAmount + temp.withdrawalAmount; %>
            <%}%>
			<tr><td align="center" colspan="3"><b>Totals</b></td>
				<td align="right"><%= rf.formattedRupee(ft.format(depositAmount))%></td>
				<td align="right"><%= rf.formattedRupee(ft.format(withdrawalAmount))%></td>
				<td align="right">&nbsp</td>
			</tr>
            </table>
			<table border=1; align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260">
				<tr><td align="center" colspan="5" color="Ivory"><b><a href="http://localhost:8090/FinancialStatements/AccountsPayableAnnual.jsp" class="button button1">Back to Account Payables Summay</a></td></b>
				</tr> 
			</table>
    </div>
</body>
</html>