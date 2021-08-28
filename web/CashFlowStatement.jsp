<%@page import="CommonModules.*"%>
<%@page import="CashFlowStatement.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Personal Financial Statement</title>
<link rel="stylesheet" href="FinancialManagementStyle.css">
</head>
<body>
    <%CashFlowCalculator CashFlowInstanceOne = new CashFlowCalculator("Two", "Sal1");%>
    <%CashFlowCalculator CashFlowInstanceTwo = new CashFlowCalculator("One", "Sal1");%>
    <%DecimalFormat ft = new DecimalFormat("Rs ##,##,##0.00");%>
    <%DecimalFormat pc = new DecimalFormat("##,##,##0.00 %");%>
    <%RupeeFormatter rf = new RupeeFormatter();%>
	
    <div>
        <h2 align=center>Cash Flow Statement</h2>
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
         <table border=1; align=center>
            <col width="1100"> 
            <col width="206"> 
          
            <tr><td align="center" colspan="2"><%= CashFlowInstanceOne.getTimePeriod()%></td></tr>
            <tr><td align="left" ><div class="tooltip">Beginning Cash Balance<span class="tooltiptext">Cash on hand at the start of the accounting period.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getBeginningCashBalance() + CashFlowInstanceTwo.getBeginningCashBalance()))%></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
            <tr><td align="left" ><div class="tooltip">Cash Receipts<span class="tooltiptext">Also called collections or simply receipts come from collecting money from customers.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getCashReceipts() + CashFlowInstanceTwo.getCashReceipts()))%></td></tr>
			<tr><td align="left" ><div class="tooltip">Cash Disbursements<span class="tooltiptext">Disbursement is writing a check to pay for the rent, for inventory, for supplies or salaries.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getCashDisbursements() + CashFlowInstanceTwo.getCashDisbursements()))%></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip"><b>Cash from Operations</b><span class="tooltiptext">Reports the flow of money into and out of business from making and selling of products. It is a good measure of how well a business is able to raise cash through operations</span></div></td>
                <td align="right"><b><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getCashReceipts() + CashFlowInstanceTwo.getCashReceipts() - CashFlowInstanceOne.getCashDisbursements() - CashFlowInstanceTwo.getCashDisbursements()))%></b></td></tr> 
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip">Fixed Asset Purchases<span class="tooltiptext">Expenses spent on fixed assets.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getFixedAssetPurchases() + CashFlowInstanceTwo.getFixedAssetPurchases()))%></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip"><b>Net Borrowings</b><span class="tooltiptext">Difference between the money lent and the money borrowed.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getNetBorrowings() + CashFlowInstanceTwo.getNetBorrowings()))%></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
				<tr><td align="left" ><div class="tooltip">Income Taxes Paid <span class="tooltiptext">Taxes on Income. For this personal Networth History, this will be the taxes deducted at source.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format((0)))%></td></tr>
			<tr><td align="left" ><div class="tooltip">Sale of Stock<span class="tooltiptext">Incoming arising out of selling stocks. For this personal Networth History, this will be the income arising out of selling assets.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format((CashFlowInstanceOne.getSaleProceeds() + CashFlowInstanceTwo.getSaleProceeds())*10))%></td></tr>
			
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip"><b>Ending Cash Balance</b><span class="tooltiptext">Ending cash balance = Beginning cash balance + cash received - cash spent</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getEndingCashBalance() + CashFlowInstanceTwo.getEndingCashBalance()))%></td></tr>
		</table>

    </div> 
	
</body>
</html>