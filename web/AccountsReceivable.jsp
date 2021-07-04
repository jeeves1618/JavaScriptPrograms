<%@page import="IncomeStatement.*"%>
<%@page import="BalanceSheet.*"%>
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
		*/
    </style>

    <%IncomeCalculator takeHomeInstanceOne = new IncomeCalculator("SalaryTwo");%>

    <%takeHomeInstanceOne.calculateOldTakeHome();%>

    <%IncomeCalculator takeHomeInstanceTwo = new IncomeCalculator("SalaryOne");%>

    <%takeHomeInstanceTwo.calculateOldTakeHome();%>

    <%buildBalanceSheet totalInc = new buildBalanceSheet(takeHomeInstanceTwo.getmonthlyTakeHome(), takeHomeInstanceOne.getmonthlyTakeHome());%>
    <div>
        <h2 align=center>Account Receivables</h2>
        
        <table border=1; align=center>
			<col width="1100"> 
            <col width="180"> 
            <tr><td align="center" colspan="2"><b>Salary Two</b></td></tr>
            <tr>
               <td align="left">Annual Salary     </td>
               <td align="right"><%= takeHomeInstanceOne.getAnnualSalaryFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Annual Tax Liability     </td>
                <td align="right"><%= takeHomeInstanceOne.getTotalTaxFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Gross Monthly Salary     </td>
                <td align="right"><%= takeHomeInstanceOne.getMonthlySalaryFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Monthly Tax Liability     </td>
                <td align="right"><%= takeHomeInstanceOne.getMonthlyTaxFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">PF Contribution     </td>
                <td align="right"><%= takeHomeInstanceOne.getPFFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Monthly Take Home</td>
                <td align="right"><%= takeHomeInstanceOne.getMonthlyTakeHomeFmtd()%></td>
            </tr>
         
            <tr><td align="center" colspan="2"><b>Salary One</b></td></tr>
            <tr>
               <td align="left">Annual Salary     </td>
               <td align="right"><%= takeHomeInstanceTwo.getAnnualSalaryFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Annual Tax Liability     </td>
                <td align="right"><%= takeHomeInstanceTwo.getTotalTaxFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Gross Monthly Salary     </td>
                <td align="right"><%= takeHomeInstanceTwo.getMonthlySalaryFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Monthly Tax Liability     </td>
                <td align="right"><%= takeHomeInstanceTwo.getMonthlyTaxFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">PF Contribution     </td>
                <td align="right"><%= takeHomeInstanceTwo.getPFFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Monthly Take Home</td>
                <td align="right"><%= takeHomeInstanceTwo.getMonthlyTakeHomeFmtd()%></td>
            </tr>
            <tr><td align="center" colspan="2"><b>Cash Flow Summary</b></td></tr>
            <tr>
               <td align="left">Interest Income    </td>
               <td align="right"><%= totalInc.getRentalIncomeTwoFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Rental Income     </td>
                <td align="right"><%= totalInc.getRentalIncomeOneFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Capital Gains     </td>
                <td align="right"><%= totalInc.getRentalIncomeThreeFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Total Monthly Income     </td>
                <td align="right"><%= totalInc.getIncomeTotalFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Total Monthly Expenses     </td>
                <td align="right"><%= totalInc.getMonthlyExpensesFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Total Monthly EMI     </td>
                <td align="right"><%= totalInc.getMonthlyEMIFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Net Estimated Savings</td>
                <td align="right"><%= totalInc.getNetSavingsFmtd()%></td>
            </tr>

            <tr>
                <td align="center" colspan="2"><b>Solvent till <%= totalInc.getSurvivalDateFmtd()%></b></td>
            </tr>
			</table>
			<table border=1; align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
				<tr><td align="center"><a href="http://localhost:8090/FinancialStatements/">Balance Sheet</a></td>
					<td align="center"><a href="http://localhost:8090/FinancialStatements/IncomeStatement.jsp">Income Statement</a></td>
					<td align="center" ><a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp">Cash Flow Statement</td>
					<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp">Account Payables</a></td>
					<td align="center"><a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp">Chart of Accounts</a></td>
				</tr>
				<tr><td align="center" colspan="3"><a href="http://localhost:8090/FinancialStatements/FIRE.jsp">Financial Independence and Early Retirement</a></td>
					<td align="center" colspan="2"><a href="http://localhost:8090/FinancialStatements/ExpenseSplit.jsp">Expense Split</td>
				</tr>
         </table>  

    </div> 
	
</body>
</html>