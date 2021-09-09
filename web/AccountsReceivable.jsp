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
<title>Personal Financial Statement</title>
</head>
<body>
	<%ViewChartOfAccounts viewChartOfAccounts = new ViewChartOfAccounts();
		String herName = viewChartOfAccounts.getHerName();
		String hisName = viewChartOfAccounts.getHisName();%>
    <%IncomeCalculator takeHomeInstanceOne = new IncomeCalculator(herName + "'s salary");%>

    <%IncomeCalculator takeHomeInstanceTwo = new IncomeCalculator(hisName + "'s salary");%>

    <%buildBalanceSheet totalInc = new buildBalanceSheet(takeHomeInstanceTwo.calculateOldTakeHome(), takeHomeInstanceOne.calculateOldTakeHome());%>
	
    <div>
        <h2 align=center>Account Receivables</h2>
		<div class="topnav">
		<a href="http://localhost:8090/FinancialStatements/">Balance Sheet</a>
		<a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp">Account Payables</a>
		<a class="active" href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp">Account Receivables</a>
		<a href="http://localhost:8090/FinancialStatements/admin.jsp?operation=View">Personalization</a>
		<a href="http://localhost:8090/FinancialStatements/NetworthHistory.jsp?operation=View">Tradeable Assets</a>
		<a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30">F.I.R.E</a>
		<a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp">Chart of Accounts</a>
		<a href="http://localhost:8090/FinancialStatements/manageNLP.jsp">NLP Processor</a>
		<a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp">Cash Flow</a>
		<a href="http://localhost:8090/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown">Unknown Transactions</a>
		</div>
		&nbsp;
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