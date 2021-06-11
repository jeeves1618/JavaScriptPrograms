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
        <h2 align=center>Cash Flow Statement</h2>
        
        <table border=1; align=center>
            <tr><td align="center" colspan="2"><b>Salary Two</b></td></tr>
            <tr>
               <td align="left">Annual Salary     </td>
               <td><%= takeHomeInstanceOne.getAnnualSalaryFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Annual Tax Liability     </td>
                <td><%= takeHomeInstanceOne.getTotalTaxFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Gross Monthly Salary     </td>
                <td><%= takeHomeInstanceOne.getMonthlySalaryFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Monthly Tax Liability     </td>
                <td><%= takeHomeInstanceOne.getMonthlyTaxFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">PF Contribution     </td>
                <td><%= takeHomeInstanceOne.getPFFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Monthly Take Home</td>
                <td><%= takeHomeInstanceOne.getMonthlyTakeHomeFmtd()%></td>
            </tr>
         
            <tr><td align="center" colspan="2"><b>Salary One</b></td></tr>
            <tr>
               <td align="left">Annual Salary     </td>
               <td><%= takeHomeInstanceTwo.getAnnualSalaryFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Annual Tax Liability     </td>
                <td><%= takeHomeInstanceTwo.getTotalTaxFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Gross Monthly Salary     </td>
                <td><%= takeHomeInstanceTwo.getMonthlySalaryFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Monthly Tax Liability     </td>
                <td><%= takeHomeInstanceTwo.getMonthlyTaxFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">PF Contribution     </td>
                <td><%= takeHomeInstanceTwo.getPFFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Monthly Take Home</td>
                <td><%= takeHomeInstanceTwo.getMonthlyTakeHomeFmtd()%></td>
            </tr>
            <tr><td align="center" colspan="2"><b>Cash Flow Summary</b></td></tr>
            <tr>
               <td align="left">Interest Income    </td>
               <td><%= totalInc.getRentalIncomeOneFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Rental Income     </td>
                <td><%= totalInc.getRentalIncomeTwoFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Capital Gains     </td>
                <td><%= totalInc.getRentalIncomeThreeFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Total Monthly Income     </td>
                <td><%= totalInc.getIncomeTotalFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Total Monthly Expenses     </td>
                <td><%= totalInc.getMonthlyExpensesFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Total Monthly EMI     </td>
                <td><%= totalInc.getMonthlyEMIFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Net Estimated Savings</td>
                <td><%= totalInc.getNetSavingsFmtd()%></td>
            </tr>

            <tr>
                <td align="center" colspan="2"><b>Solvent till <%= totalInc.getSurvivalDateFmtd()%></b></td>
            </tr>
			</table>
			<table border=1; style="float:right">
			<col width="325"> 
			<col width="325"> 
			<col width="325"> 
			<col width="325">
				<tr><td align="center"><a href="http://localhost:8090/FinancialStatements/">Balance Sheet</a></td>
					<td align="center"><a href="http://localhost:8090/FinancialStatements/IncomeStatement.jsp">Income Statement</a></td>
					<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp">Account Payables</a></td>
					<td align="center"><a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp">Chart of Accounts</a></td>
				</tr>
           
         </table>  

    </div> 
	
</body>
</html>