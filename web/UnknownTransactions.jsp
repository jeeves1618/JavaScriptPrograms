<%@page import="ViewServices.*"%>
<%@page import="CommonModules.*"%>
<%@page import="java.text.* "%>
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
</head>
<body>
	<% entryCategory = request.getParameter("entry_category");%>
    <%ViewPayablesDrilldown viewPayablesDrilldown = new ViewPayablesDrilldown(entryCategory);
      ListIterator<AccountStatement> requestIterator = viewPayablesDrilldown.getPayables().listIterator();
	  DecimalFormat ft = new DecimalFormat("Rs ##,##,##0.00");
      RupeeFormatter rf = new RupeeFormatter();
	  AccountStatement temp;
	  entrySerialNumber = 1;
	  withdrawalAmount = 0;
	  depositAmount = 0;
	  
	  ViewNaturalLanguageProcessor NLP = new ViewNaturalLanguageProcessor();
	  NaturalLanguageProcessor N = NLP.getTokenEntry(9999999);%>
    
    <div>
        <h2 align=center><%= entryCategory%> Transactions</h2>
		<table border=1; align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260">
            <tr><td align="center"><a href="http://localhost:8090/FinancialStatements/" class="button button2">Balance Sheet</a></td>
                <td align="center"><a href="http://localhost:8090/FinancialStatements/NetworthHistory.jsp" class="button button2">Networth History</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp" class="button button2">Cash Flow Statement</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayableAnnual.jsp" class="button button2">Account Payables</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
            </tr>
			<tr><td align="center" colspan="1"><a href="http://localhost:8090/FinancialStatements/manageNLP.jsp" class="button button2">NLP Tokens</a></td>
				<td align="center" colspan="2"><a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30" class="button button2">Financial Independence and Early Retirement</a></td>
				<td align="center" colspan="1"><a href="http://localhost:8090/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown" class="button button3">Unknown Transactions</a></td>
				<td align="center" colspan="1"><a href="http://localhost:8090/FinancialStatements/ExpenseSplit.jsp" class="button button2">Expense Split</a></td>
			</tr>
			
        </table>
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
				<tr><td align="center" colspan="5" color="Ivory"><b><a href="http://localhost:8090/FinancialStatements/AccountsPayableAnnual.jsp" class="button button2">Back to Account Payables Summay</a></td></b>
				</tr> 
			</table>
    </div>
</body>
</html>