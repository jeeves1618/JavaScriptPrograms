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
<title>View Payables Entries</title>
</head>
<body>

    <style type="text/css">
        body {
            font-family: 'Courier New', Courier, monospace;
            font-size: medium;
            font: outline;
            margin: 1pt;
            background-color: Ivory;
            padding: 1%;
        }
        h1 {
            font-size: x-large;
        }
        h2 {
            font-size: large;
        }
    </style>
	<% entryCategory = request.getParameter("entry_category");%>
    <%ViewPayablesDrilldown viewPayablesDrilldown = new ViewPayablesDrilldown(entryCategory);
      ListIterator<AccountStatement> requestIterator = viewPayablesDrilldown.getPayables().listIterator();
	  DecimalFormat ft = new DecimalFormat("Rs ##,##,##0.00");
      RupeeFormatter rf = new RupeeFormatter();
	  AccountStatement temp;
	  entrySerialNumber = 1;
	  withdrawalAmount = 0;
	  depositAmount = 0;%>
    
    <div>
        <h2 align=center>Entries under <%= entryCategory%></h2>
		<table border=1; align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260">
            <tr><td align="center"><a href="http://localhost:8090/FinancialStatements/">Balance Sheet</a></td>
                <td align="center"><a href="http://localhost:8090/FinancialStatements/IncomeStatement.jsp">Income Statement</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp">Cash Flow Statement</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp">Account Payables</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp">Account Receivables</a></td>
            </tr>
			<tr><td align="center" colspan="3"><a href="http://localhost:8090/FinancialStatements/FIRE.jsp">Financial Independence and Early Retirement</a></td>
				<td align="center" colspan="2"><a href="http://localhost:8090/FinancialStatements/ExpenseSplit.jsp">Expense Split</a></td>
			</tr>
			<tr><td align="center" colspan="5" color="Ivory"><b><a href="http://localhost:8090/FinancialStatements/AccountsPayableAnnual.jsp">Back to Account Payables Summay</a></td></b>
            </tr> 
        </table>
        <table border=1; align=center>
            <col width="50"> 
            <col width="150"> 
            <col width="700"> 
            <col width="200"> 
			<col width="200"> 
            <tr><td align="center"><b>S.No</b></td>
                <td align="center"><b>Transaction Date</b></td>
				<td align="center"><b>Transaction Remarks</b></td>
				<td align="center"><b>Deposit Amount</b></td>
				<td align="center"><b>Withdrawal Amount</b></td>
			</tr>
            
			<%while (requestIterator.hasNext()) {
            temp = requestIterator.next(); %>
				<tr><td align="center" ><%= entrySerialNumber%></td>
					<td align="left" style="padding-left:10px"><%= temp.transactionDate%></td>
					<td align="left" style="padding-left:10px"><%= temp.transactionRemarks%></td>
					<td align="right" style="padding-left:10px"><%= rf.formattedRupee(ft.format(temp.depositAmount))%></td>
					<td align="right" style="padding-left:10px"><%= rf.formattedRupee(ft.format(temp.withdrawalAmount))%></td>
				</tr>
				<%entrySerialNumber = entrySerialNumber + 1;
				  depositAmount = depositAmount + temp.depositAmount;
				  withdrawalAmount = withdrawalAmount + temp.withdrawalAmount; %>
            <%}%>
			<tr><td align="center" colspan="3"><b>Totals</b></td>
				<td align="right"><%= rf.formattedRupee(ft.format(depositAmount))%></td>
				<td align="right"><%= rf.formattedRupee(ft.format(withdrawalAmount))%></td>
			</tr>
            </table>
			
    </div>
</body>
</html>