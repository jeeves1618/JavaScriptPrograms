<%@page import="ViewServices.*"%>
<%@page import="CommonModules.*"%>
<%@ page import="java.util.*" %>
<%!int NLPListIterator; %>
<%! int identificationNumForAdd; %>
<% int tokenNumber = Integer.parseInt(request.getParameter("tokenNumber"));%>
<% String tokenizedWord = request.getParameter("tokenizedWord");%>
<% String segmentCategory = request.getParameter("segmentCategory");%>
<% String isDiscretionary = request.getParameter("isDiscretionary");%>
<% String buttonAction = request.getParameter("buttonAction");%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Natural Language Processor</title>
<link rel="stylesheet" href="FinancialManagementStyle.css">
</head>
<body>
   
	
    <%
	  ViewNaturalLanguageProcessor NLP = new ViewNaturalLanguageProcessor();	  
	  if (buttonAction.equals("Delete")){
		  NLP.deleteTokenEntry(tokenNumber);
	  }
	  else {
	  NLP.updateTokenEntry(tokenNumber, tokenizedWord, segmentCategory, isDiscretionary);
	  }
      ArrayList<NaturalLanguageProcessor> NLPlist = NLP.getNlpEntries();%>	  
		  
	<main class="maincontent">
    <div>
        <h2 align=center>Natural Language Processor Tokens</h2>
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
            <col width="80"> 
            <col width="365"> 
            <col width="282"> 
			<col width="18">
			<col width="265">
			<col width="115">
            <tr><td align="center"><b>S.No</b></td>
                <td align="center"><b>Token ID</b></td>
				<td align="center"><b>Tokenized Word</b></td>
				<td align="center"><b>Segmented Category</b></td>
				<td align="center"><b>Discretionary?</b></td>
				<td align="center"><b>Last Used Time</b></td>
				<td align="center"><b>Actions</b></td>
			</tr>
                
			<%for (int nlpEntriesIterator = 0; nlpEntriesIterator < NaturalLanguageProcessor.numofElements; nlpEntriesIterator++){ %>
				<tr><td align="center" ><%= nlpEntriesIterator + 1%></td>
					<td align="left" style="padding-left:10px"><%= NLPlist.get(nlpEntriesIterator).identificationNumber%></td>
					<td align="left" style="padding-left:10px"><%= NLPlist.get(nlpEntriesIterator).tokenizedWord%></td>
					<td align="left" style="padding-left:10px"><%= NLPlist.get(nlpEntriesIterator).entryCategory%></td>
					<td align="left" style="padding-left:10px"><%= NLPlist.get(nlpEntriesIterator).discretionarySpendingIndicator%></td>
					<td align="left" style="padding-left:10px"><%= NLPlist.get(nlpEntriesIterator).lastUsedDate%></td>
					<td align="left" style="padding-left:0px"><b><form action="http://localhost:8090/FinancialStatements/EditNLPToken.jsp?tokenNumber=<%= NLPlist.get(nlpEntriesIterator).identificationNumber%>&operation=Update" method="POST">
																	<input type="submit" value="Update"></form>&nbsp;<form action="http://localhost:8090/FinancialStatements/EditNLPToken.jsp?tokenNumber=<%= NLPlist.get(nlpEntriesIterator).identificationNumber%>&operation=Delete" method="POST"><input type="submit" value="Delete"></form></b></td>
				</tr>
				<%identificationNumForAdd = NLPlist.get(nlpEntriesIterator).identificationNumber;%>
            <%}%>
            </table>
			&nbsp;
			<table border=1; align=center>
			<col width="1312"> 
			<tr><td align="center"><form action="http://localhost:8090/FinancialStatements/EditNLPToken.jsp?tokenNumber=<%= identificationNumForAdd%>&operation=Add" method="POST"><input type="submit" value="Add"></form></td>
			</tr></table
    </div>
	</main>
</body>
</html>
