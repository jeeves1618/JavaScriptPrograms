<%@page import="ViewServices.*"%>
<%@page import="CommonModules.*"%>
<% int tokenNumber = Integer.parseInt(request.getParameter("tokenNumber"));%> 
<%String operation = request.getParameter("operation");%>
<%String cancelURL;%>

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

    <%
	 ViewNaturalLanguageProcessor viewNLP = new ViewNaturalLanguageProcessor(); 
     NaturalLanguageProcessor NLPToken = viewNLP.getTokenEntry(tokenNumber);
	 if (operation.equals("Categorize")) {
		 cancelURL = "http://localhost:8090/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown";
	 } else {
		 cancelURL = "http://localhost:8090/FinancialStatements/manageNLP.jsp";
	 }
	 %>
	     
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
            
				<form action="http://localhost:8090/FinancialStatements/PersistNLP.jsp?" method="POST">
				<% if (operation.equals("Add")) {
					NLPToken.identificationNumber = tokenNumber + 1;
					NLPToken.tokenizedWord = " ";
					NLPToken.lastUsedDate = "Not used";
				};
				if (operation.equals("Categorize")) {
					NLPToken.identificationNumber = tokenNumber + 1;
					NLPToken.tokenizedWord = request.getParameter("txnRemarks");
					NLPToken.lastUsedDate = "Not used";
				};
				%>
				
				<tr><td align="center" >1</td>
					<td align="left" style="padding-left:10px"><input type="text" name="tokenNumber" value="<%= NLPToken.identificationNumber%>" readonly></td>
					<td align="left" style="padding-left:10px"><input type="text" name="tokenizedWord" style="text-transform:uppercase" size="53" value="<%= NLPToken.tokenizedWord%>"></td>
					<td align="left" style="padding-left:10px">
					<select name="segmentCategory" id="segmentCategory">
						<option value="Investments">Investments</option>
						<option value="Family">Family</option>
						<option value="Monthly EMI">Monthly EMI</option>
						<option value="Cash Withdrawals">Cash Withdrawals</option>
						<option value="Apartment Maintenance">Apartment Maintenance</option>
						<option value="Electricity Expenses">Electricity Expenses</option>
						<option value="Groceries">Groceries</option>
						<option value="Interest Income">Interest Income</option>
						<option value="Sale Proceeds">Sale Proceeds</option>
						<option value="House Keeping">House Keeping</option>
						<option value="Entertainment">Entertainment</option>
						<option value="Salary">Salary</option>
						<option value="Travel Expenses">Travel Expenses</option>
						<option value="Dividend Income">Dividend Income</option>
						<option value="Shopping and Eatout">Shopping and Eatout</option>
						<option value="Savings">Savings</option>
						<option value="Rental Income">Rental Income</option>
						<option value="Brokerage Maintenance">Brokerage Maintenance</option>
						<option value="Capital Market Transactions">Capital Market Transactions</option>
						<option value="Insurance">Insurance</option>
						<option value="Healthcare and Fitness">Healthcare and Fitness</option>
						<option value="Discretionary Learning">Discretionary Learning</option>
						<option value="Education">Education</option>
						<option value="Bookentries">Bookentries</option>
						<option value="Miscellaneous">Miscellaneous</option>

					  </select>		
					</td>
					<td align="center" style="padding-left:10px">
					<select name="isDiscretionary" id="isDiscretionary">
						<option value="Y">Yes</option>
						<option value="N">No</option>
					</select>
					<td align="left" style="padding-left:10px"><%= NLPToken.lastUsedDate%></td>
					<td align="center" style="padding-left:0px"><b><input type="submit" name="buttonAction" value="<%= operation%>"></b></td> 
				</tr>
				</form>
            
            </table>
			&nbsp;
			</form>
			<div align="center"><form action="<%= cancelURL%>" method="POST"><input type="submit" value="Cancel"></form></div>
    </div>
	</main>
</body>
</html>