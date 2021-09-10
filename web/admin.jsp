<%@page import="ViewServices.*"%>
<%@page import="CommonModules.*"%>
<%@page import="admin.*"%>
<%@page import="org.apache.commons.configuration2.ex.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html5>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
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
   
	<main class="maincontent">
    <div>
        <h2 align=center>Admin</h2>
<%	CurrencyCustomization currencyCustomization = new CurrencyCustomization();
	String currencyFormat = new CurrencyCustomization().getCurrencyFormat();
	String messageText, refreshMessageText;
	refreshMessageText = "Please click on the 'Refresh NLP Token List' button to refresh the last used date and time of tokens in the NLP Processor tab.";
	messageText = currencyCustomization.getMessage();
	String currencyFormatNew = request.getParameter("currencyFormatNew");
	String operation = request.getParameter("operation");
	String Plog1 = "Log1";
	if (operation.equals("Update")){
		Plog1 = "Log2";
		try {
			currencyCustomization.customizeCurrency("testToken",currencyFormatNew);
		}catch (ConfigurationException e) {
            e.printStackTrace();
        }
		messageText = currencyCustomization.getMessage();
  }
  if (operation.equals("Refresh")){
			NLPTokenManager ExpenseInstanceTwo = new NLPTokenManager();
			refreshMessageText = ExpenseInstanceTwo.NLPTokenRefresh("One", "Sal1");
			refreshMessageText = ExpenseInstanceTwo.NLPTokenRefresh("Two", "Sal1");
			refreshMessageText = ExpenseInstanceTwo.NLPTokenRefresh("One", "Sav1");
			refreshMessageText = ExpenseInstanceTwo.NLPTokenRefresh("Two", "Sav1");
	}
  %>
		
<div class="topnav">
<a href="http://localhost:8080/FinancialStatements/">Balance Sheet</a>
<a href="http://localhost:8080/FinancialStatements/AccountsPayable.jsp">Payables</a>
<a href="http://localhost:8080/FinancialStatements/AccountsReceivable.jsp">Receivables</a>
<a class="active" href="http://localhost:8080/FinancialStatements/admin.jsp?operation=View">Personalization</a>
<a href="http://localhost:8080/FinancialStatements/NetworthHistory.jsp?operation=View">Tradeables</a>
<a href="http://localhost:8080/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30">F.I.R.E</a>
<a href="http://localhost:8080/FinancialStatements/chartOfAccounts.jsp">Chart Of Accounts</a>
<a href="http://localhost:8080/FinancialStatements/manageNLP.jsp">NLP</a>
<a href="http://localhost:8080/FinancialStatements/CashFlowStatement.jsp">Cash Flow</a>
<a href="http://localhost:8080/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown">Unknown Entries</a>
</div>
		&nbsp;
		<table class="class2"border=0; align=center>
		<col width="1310">
			<tr><td align="center" bgcolor="white"><b><%=messageText%></b></td></tr>	
		</table>
		&nbsp;
        <table class="class2"border=1; align=center>
            <col width="572"> 
			<col width="572">
            <col width="160">
            <tr><td align="center" bgcolor="white"><b>Current Format</b></td>
				<td align="center" bgcolor="white"><b>New Format</b></td>
                <td align="center" bgcolor="white"><b>Action</b></td>
			</tr>
            
			<tr><td align="center"  bgcolor="white"><%= currencyFormat%></td>				
				<td align="center"  bgcolor="white">
				<form action="http://localhost:8080/FinancialStatements/admin.jsp?operation=Update" method="POST">					
					  <select name="currencyFormatNew" id="currencyFormatNew">
						<option value="Rs ##,##,##0.00">"Rs ##,##,##0.00"</option>
						<option value="Rs ###,##0.00">"Rs ###,##0.00"</option>
						<option value="$ ###,##0.00">"$ ###,##0.00"</option>
						<option value="USD ###,##0.00">"USD ###,##0.00"</option>
						<option value="SGD ###,##0.00">"SGD ###,##0.00"</option>
						<option value="CAD ###,##0.00">"CAD ###,##0.00"</option>
					  </select>		</td>
				<td align="center"  bgcolor="white" style="padding-left:0px"><b><input type="submit" value="Convert Currency"></form></b></td> 
			</tr>
          </table>
		  &nbsp;
		  <table class="class2"border=1; align=center>
			<col width="1000">
			<col width="305">
			<tr><td align="left"  bgcolor="white"><b><%=refreshMessageText%></b></td>
				<form action="http://localhost:8080/FinancialStatements/admin.jsp?operation=Refresh" method="POST">	
				<td align="center"  bgcolor="white" style="padding-left:0px"><b><input type="submit" value="Refresh NLP Token List"></form></b></td></tr>	 
		   </table>
    </div>
	</main>
</body>
</html>
