<%@page import="ViewServices.*"%>
<%@page import="CommonModules.*"%>
<%@page import="admin.*"%>
<%@page import="org.apache.commons.configuration2.ex.*"%>
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
		&nbsp;
		<table class="class2"border=1; align=center>
		<col width="1310">
			<tr><td align="center" bgcolor="lightblue"><b><%=messageText%></b></td></tr>	
		</table>
		&nbsp;
        <table class="class2"border=1; align=center>
            <col width="572"> 
			<col width="572">
            <col width="160">
            <tr><td align="center" bgcolor="lightgrey"><b>Current Format</b></td>
				<td align="center" bgcolor="lightgrey"><b>New Format</b></td>
                <td align="center" bgcolor="lightgrey"><b>Action</b></td>
			</tr>
            
			<tr><td align="center"  bgcolor="lightgrey"><%= currencyFormat%></td>				
				<td align="center"  bgcolor="lightgrey">
				<form action="http://localhost:8090/FinancialStatements/admin.jsp?operation=Update" method="POST">					
					  <select name="currencyFormatNew" id="currencyFormatNew">
						<option value="Rs ##,##,##0.00">"Rs ##,##,##0.00"</option>
						<option value="Rs ###,##0.00">"Rs ###,##0.00"</option>
						<option value="$ ###,##0.00">"$ ###,##0.00"</option>
						<option value="USD ###,##0.00">"USD ###,##0.00"</option>
						<option value="SGD ###,##0.00">"SGD ###,##0.00"</option>
						<option value="CAD ###,##0.00">"CAD ###,##0.00"</option>
					  </select>		</td>
				<td align="center"  bgcolor="lightgrey" style="padding-left:0px"><b><input type="submit" value="Convert Currency"></form></b></td> 
			</tr>
          </table>
		  &nbsp;
		  <table class="class2"border=1; align=center>
			<col width="1000">
			<col width="305">
			<tr><td align="left"  bgcolor="lightgrey"><b><%=refreshMessageText%></b></td>
				<form action="http://localhost:8090/FinancialStatements/admin.jsp?operation=Refresh" method="POST">	
				<td align="center"  bgcolor="lightgrey" style="padding-left:0px"><b><input type="submit" value="Refresh NLP Token List"></form></b></td></tr>	 
		   </table>
    </div>
	</main>
</body>
</html>
