<%@page import="CommonModules.*"%>
<%@page import="CashFlowStatement.*"%>
<%@page import="java.text.*"%>
<%@page import="admin.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Personal Financial Statement</title>
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
    <%CashFlowCalculator CashFlowInstanceOne = new CashFlowCalculator("Two", "Sal1");%>
    <%CashFlowCalculator CashFlowInstanceTwo = new CashFlowCalculator("One", "Sal1");%>
    <%String currencyFormat = new CurrencyCustomization().getCurrencyFormat();
	  DecimalFormat ft = new DecimalFormat(currencyFormat);%>
    <%DecimalFormat pc = new DecimalFormat("##,##,##0.00 %");%>
    <%RupeeFormatter rf = new RupeeFormatter();%>
	
    <div>
        <h2 align=center>Cash Flow Statement</h2>
        <div class="topnav">
		<a href="http://localhost:8080/FinancialStatements/">Balance Sheet</a>
		<a href="http://localhost:8080/FinancialStatements/AccountsPayable.jsp">Payables</a>
		<a href="http://localhost:8080/FinancialStatements/AccountsReceivable.jsp">Receivables</a>
		<a href="http://localhost:8080/FinancialStatements/admin.jsp?operation=View">Personalization</a>
		<a href="http://localhost:8080/FinancialStatements/NetworthHistory.jsp?operation=View">Tradeables</a>
		<a href="http://localhost:8080/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30">F.I.R.E</a>
		<a href="http://localhost:8080/FinancialStatements/chartOfAccounts.jsp">Chart of Accounts</a>
		<a href="http://localhost:8080/FinancialStatements/manageNLP.jsp">NLP</a>
		<a class="active" href="http://localhost:8080/FinancialStatements/CashFlowStatement.jsp">Cash Flow</a>
		<a href="http://localhost:8080/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown">Unknown Entries</a>
		</div>
		&nbsp;
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