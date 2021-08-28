<%@page import="IncomeStatement.*"%>
<%@page import="BalanceSheet.*"%>
<%@page import="ViewServices.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="FinancialManagementStyle.css">
<title>Personal Financial Statement</title>
</head>
<body>

    <%IncomeCalculator takeHomeInstanceOne = new IncomeCalculator("SalaryTwo");%>

    <%takeHomeInstanceOne.calculateOldTakeHome();%>

    <%IncomeCalculator takeHomeInstanceTwo = new IncomeCalculator("SalaryOne");%>

    <%takeHomeInstanceTwo.calculateOldTakeHome();%>

    <%buildBalanceSheet totalInc = new buildBalanceSheet(takeHomeInstanceTwo.getmonthlyTakeHome(), takeHomeInstanceOne.getmonthlyTakeHome());%>
	<%ViewChartOfAccounts viewChartOfAccounts = new ViewChartOfAccounts();
		String herName = viewChartOfAccounts.getHerName();
		String hisName = viewChartOfAccounts.getHisName();%>
    <div>
        <h2 align=center>Account Receivables</h2>
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
            <col width="205"> 
            <tr><td align="center" colspan="2" ><b><%= herName%>'s Salary</b></td></tr>
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
         
            <tr><td align="center" colspan="2"><b><%= hisName%>'s Salary</b></td></tr>
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
            <tr><td align="center" colspan="2"><b>Summary of Receivables</b></td></tr>
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

    </div> 
	
</body>
</html>