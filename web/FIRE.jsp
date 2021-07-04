<%@page import="CommonModules.*"%>
<%@page import="CashFlowStatement.*"%>
<%@page import="IncomeStatement.*"%>
<%@page import="BalanceSheet.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Personal Financial Statement</title>
</head>
<body>

    <style type="text/css">
        body {
            font-family: 'Courier New', Courier, monospace;
            font-size: medium;
            font: outline;
            margin: 1pt;
            background-color: FloralWhite;
            padding: 1%;
        }
        h1 {
            font-size: x-large;
        }
        h2 {
            font-size: large;
        }
		/*
        .split {
                height: 100%;
                width: 73.1%;
                position: fixed;
                z-index: 1;
                top: 0;
                overflow-x: hidden;
                padding-top: 2px;
                }

        .left {
        left: 0;
        background-color: #FCF3CF;
        padding: 5px;
        }

        .right {
        right: 0;
        width: 28.5%;
        text-align: right;
        padding: 5px;
        background-color:#EAFAF1;
        }
		/* Tooltip container */
		.tooltip {
		  position: relative;
		  display: inline-block;
		  border-bottom: 1px dotted black; /* If you want dots under the hoverable text */
		}

		/* Tooltip text */
		.tooltip .tooltiptext {
		  visibility: hidden;
		  width: 320px;
		  background-color: white;
		  color: black;
		  text-align: center;
		  padding: 5px 0;
		  border-radius: 6px;
		 
		  /* Position the tooltip text - see examples below! */
		  position: absolute;
		  z-index: 1;
		}

		/* Show the tooltip text when you mouse over the tooltip container */
		.tooltip:hover .tooltiptext {
		  visibility: visible;
		*/
    </style>

    <%CashFlowCalculator CashFlowInstanceOne = new CashFlowCalculator("Ben", "Sal1");%>
    <%CashFlowCalculator CashFlowInstanceTwo = new CashFlowCalculator("Bun", "Sal1");%>
    <%DecimalFormat ft = new DecimalFormat("Rs ##,##,##0.00");%>
    <%DecimalFormat pc = new DecimalFormat("##,##,##0.00 %");%>
    <%RupeeFormatter rf = new RupeeFormatter();%>
	
	<%IncomeCalculator takeHomeInstanceOne = new IncomeCalculator("SalaryTwo");%>

    <%takeHomeInstanceOne.calculateOldTakeHome();%>

    <%IncomeCalculator takeHomeInstanceTwo = new IncomeCalculator("SalaryOne");%>

    <%takeHomeInstanceTwo.calculateOldTakeHome();%>

    <%buildBalanceSheet totalInc = new buildBalanceSheet(takeHomeInstanceTwo.getmonthlyTakeHome(), takeHomeInstanceOne.getmonthlyTakeHome());%>
    <div>
        <h2 align=center>Financial Independence and Retiring Early</h2>
        
        <table border=1; align=center>
            <col width="1100"> 
            <col width="180"> 
          
            <tr><td align="center" colspan="2"><%= CashFlowInstanceOne.getTimePeriod()%></td></tr>
            <tr><td align="left" ><div class="tooltip">Non Discretionary Expenses<span class="tooltiptext">Cash on hand at the start of the accounting period.</span></div></td>
                <td align="right"><%= totalInc.getMonthlyExpensesFmtd()%></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
            <tr><td align="left" ><div class="tooltip">Current Networth<span class="tooltiptext">Also called collections or simply receipts come from collecting money from customers.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getCashReceipts() + CashFlowInstanceTwo.getCashReceipts()))%></td></tr>
			<tr><td align="left" ><div class="tooltip">Fire Target<span class="tooltiptext">Disbursement is writing a check to pay for the rent, for inventory, for supplies or salaries.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getCashDisbursements() + CashFlowInstanceTwo.getCashDisbursements()))%></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip"><b>Inflation Rate</b><span class="tooltiptext">Reports the flow of money into and out of business from making and selling of products. It is a good measure of how well a business is able to raise cash through operations</span></div></td>
                <td align="right"><b><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getCashReceipts() + CashFlowInstanceTwo.getCashReceipts() - CashFlowInstanceOne.getCashDisbursements() - CashFlowInstanceTwo.getCashDisbursements()))%></b></td></tr> 
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip">Rate of Return<span class="tooltiptext">Expenses spent on fixed assets.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getFixedAssetPurchases() + CashFlowInstanceTwo.getFixedAssetPurchases()))%></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip"><b>Target Deficit</b><span class="tooltiptext">Difference between the money lent and the money borrowed.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getNetBorrowings() + CashFlowInstanceTwo.getNetBorrowings()))%></td></tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
				<tr><td align="left" ><div class="tooltip">Income Taxes Paid <span class="tooltiptext">Taxes on Income. For this personal income statement, this will be the taxes deducted at source.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format((0)))%></td></tr>
			<tr><td align="left" ><div class="tooltip">Sale of Stock<span class="tooltiptext">Incoming arising out of selling stocks. For this personal income statement, this will be the income arising out of selling assets.</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format((CashFlowInstanceOne.getSaleProceeds() + CashFlowInstanceTwo.getSaleProceeds())*10))%></td></tr>
			
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td></tr>
			<tr><td align="left" ><div class="tooltip"><b>Ending Cash Balance</b><span class="tooltiptext">Ending cash balance = Beginning cash balance + cash received - cash spent</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(CashFlowInstanceOne.getEndingCashBalance() + CashFlowInstanceTwo.getEndingCashBalance()))%></td></tr>
		</table>
			<table border=1; align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
				<tr><td align="center"><a href="http://localhost:8090/FinancialStatements/">Balance Sheet</a></td>
					<td align="center"><a href="http://localhost:8090/FinancialStatements/IncomeStatement.jsp">Income Statement</a></td>
					<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp">Account Payables</a></td>
					<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp">Account Receivables</a></td>
					<td align="center"><a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp">Chart of Accounts</a></td>
				</tr>
				<tr><td align="center" colspan="3"><a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp">Cash Flow Statement</a></td>
					<td align="center" colspan="2"><a href="http://localhost:8090/FinancialStatements/ExpenseSplit.jsp">Expense Split</a></td>
				</tr>
         </table>  

    </div> 
	
</body>
</html>