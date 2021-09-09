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
		<div class="topnav">
		<a href="http://localhost:8090/FinancialStatements/">Balance Sheet</a>
		<a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp">Account Payables</a>
		<a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp">Account Receivables</a>
		<a href="http://localhost:8090/FinancialStatements/admin.jsp?operation=View">Personalization</a>
		<a href="http://localhost:8090/FinancialStatements/NetworthHistory.jsp?operation=View">Tradeable Assets</a>
		<a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30">F.I.R.E</a>
		<a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp">Chart of Accounts</a>
		<a class="active" href="http://localhost:8090/FinancialStatements/manageNLP.jsp">NLP Processor</a>
		<a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp">Cash Flow</a>
		<a href="http://localhost:8090/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown">Unknown Transactions</a>
		</div>
		&nbsp;
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
