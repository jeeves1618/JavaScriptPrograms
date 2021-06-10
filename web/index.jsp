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
            background-color: aquamarine;
            padding: 1%;
        }
        h1 {
            font-size: x-large;
        }
        h2 {
            font-size: large;
        }
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
    </style>

    <%IncomeCalculator takeHomeInstanceOne = new IncomeCalculator("SalaryTwo");%>

    <%takeHomeInstanceOne.calculateOldTakeHome();%>

    <%IncomeCalculator takeHomeInstanceTwo = new IncomeCalculator("SalaryOne");%>

    <%takeHomeInstanceTwo.calculateOldTakeHome();%>

    <%buildBalanceSheet totalInc = new buildBalanceSheet(takeHomeInstanceTwo.getmonthlyTakeHome(), takeHomeInstanceOne.getmonthlyTakeHome());%>

    <div class="split right">
        <h2 align=center>Cash Flow Statement</h2>
        
        <table border=1; style="float:right">
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
               <td align="left">Indus Rent     </td>
               <td><%= totalInc.getRentalIncomeOneFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Amalfi Rent     </td>
                <td><%= totalInc.getRentalIncomeTwoFmtd()%></td>
            </tr>
            
            <tr>
                <td align="left">Neelkamal Rent     </td>
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
                <td align="center" colspan="2"><b>Survival till <%= totalInc.getSurvivalDateFmtd()%></b></td>
            </tr>
            
         </table>  
        
    </div>
    <div class="split left">
        <h2 align=center>Personal Balance Sheet</h2>
        <table border=1; style="float:right">
            <col width="340"> 
            <col width="180"> 
            <col width="340"> 
            <col width="180"> 
            <tr><td align="center" colspan="2"><b>Asset</b></td>
                <td align="center" colspan="2"><b>Liability</b></td></tr>
            <tr><td align="left" colspan="2"><b>Liquid Assets</b></td>
                <td align="left" colspan="2"><b>Accrued Expenses</b></td></tr>
            
            <tr><td align="left" ><%= totalInc.chartOfAccountsList[0].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[0].cashValueFmtd%></td>
                <td align="left" ><%= totalInc.chartOfAccountsList[14].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[14].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" ><%= totalInc.chartOfAccountsList[1].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[1].cashValueFmtd%></td>
                <td align="left" colspan="2"><b><%= totalInc.chartOfAccountsList[18].subType%></b></td>
            </tr>
            
            <tr><td align="left" colspan="2"><b><%= totalInc.chartOfAccountsList[4].subType%></b></td>
                <td align="left" ><%= totalInc.chartOfAccountsList[15].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[15].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" ><%= totalInc.chartOfAccountsList[2].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[2].cashValueFmtd%></td>
                <td align="left" ><%= totalInc.chartOfAccountsList[16].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[16].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" ><%= totalInc.chartOfAccountsList[3].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[3].cashValueFmtd%></td>
                <td align="left" ><%= totalInc.chartOfAccountsList[17].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[17].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" ><%= totalInc.chartOfAccountsList[4].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[4].cashValueFmtd%></td>
                <td align="left" ><%= totalInc.chartOfAccountsList[18].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[18].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" ><%= totalInc.chartOfAccountsList[5].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[5].cashValueFmtd%></td>
                <td align="left" ><%= totalInc.chartOfAccountsList[19].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[19].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" colspan="1"><b><%= totalInc.chartOfAccountsList[30].subType%></b></td>
                <td align="right" colspan="1"><%= totalInc.chartOfAccountsList[30].cashValueFmtd%></td>
                <td align="left" colspan="1"><b><%= totalInc.chartOfAccountsList[31].subType%></b></td>
                <td align="right" colspan="1"><%= totalInc.chartOfAccountsList[31].cashValueFmtd%></td>
            </tr>

            <tr><td align="left" colspan="2"><b><%= totalInc.chartOfAccountsList[6].subType%></b>
                <td align="left" colspan="2"><b><%= totalInc.chartOfAccountsList[20].subType%></b>
            </tr>

            <tr><td align="left" ><%= totalInc.chartOfAccountsList[6].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[6].cashValueFmtd%></td>
                <td align="left" ><%= totalInc.chartOfAccountsList[20].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[20].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" ><%= totalInc.chartOfAccountsList[7].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[7].cashValueFmtd%></td>
                <td align="left" ><%= totalInc.chartOfAccountsList[21].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[21].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" ><%= totalInc.chartOfAccountsList[8].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[8].cashValueFmtd%></td>
                <td align="left" ><%= totalInc.chartOfAccountsList[22].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[22].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" ><%= totalInc.chartOfAccountsList[9].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[9].cashValueFmtd%></td>
                <td align="left" ><%= totalInc.chartOfAccountsList[23].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[23].cashValueFmtd%></td>
            </tr>

            <tr><td align="left" colspan="2"><b><%= totalInc.chartOfAccountsList[10].subType%></b></td>
                <td align="left" colspan="2"></td>
            </tr>

            <tr><td align="left" ><%= totalInc.chartOfAccountsList[11].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[11].cashValueFmtd%></td>
                <td align="left" colspan="2"></td>
            </tr>

            <tr><td align="left" ><%= totalInc.chartOfAccountsList[12].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[12].cashValueFmtd%></td>
                <td align="left" colspan="2"></td>
            </tr>

            <tr><td align="left" ><%= totalInc.chartOfAccountsList[13].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[13].cashValueFmtd%></td>
                <td align="left" colspan="2"></td>
            </tr>

            <tr><td align="left" ><b><%= totalInc.chartOfAccountsList[33].itemDescription%></b></td>
                <td align="right"><%= totalInc.chartOfAccountsList[33].cashValueFmtd%></td>
                <td align="left" ><b><%= totalInc.chartOfAccountsList[32].subType%></b></td>
                <td align="right"><%= totalInc.chartOfAccountsList[32].cashValueFmtd%></td>
            </tr>

            <tr><td align="left" ><b>Total Assets</b></td>
                <td align="right"><%= totalInc.getTotalAssetsFmtd()%></td>
                <td align="left" ><b>Total Liabilities</b></td>
                <td align="right"><%= totalInc.getTotalLiabilitiesFmtd()%></td>
            </tr>

            <tr><td align="left" colspan="2"></td>
                <td align="left" ><b>Total Equity</b></td>
                <td align="right"><%= totalInc.getNetWorthFmtd()%></td>
            </tr>
			<tr><td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp">Account Payables</a></td>
				<td align="center"><a href="http://localhost:8090/FinancialStatements/IncomeStatement.jsp">Income Statement</a></td>
				<td align="center" >Cash Flow Statement</td>
				<td align="center"><a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp">Chart of Accounts</a></td>
			</tr>
    </div>
</body>
</html>