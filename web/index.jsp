<%@page import="IncomeStatement.*"%>
<%@page import="BalanceSheet.*"%>
<%@page import="CommonModules.*"%>
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
		*/
		.button {
				  border: none;
				  color: white;
				  padding: 2px 2px;
				  text-align: center;
				  text-decoration: none;
				  display: inline-block;
				  font-size: medium;
				  margin: 0px 0px;
				  transition-duration: 0.4s;
				  cursor: pointer;
				 }
		.button2 {
					background-color: Snow;
					color: black;
					border: 2px solid #008CBA;
				}
		.button2:hover {
					background-color: SlateGray;
					color: white;
				}
    </style>

    <%IncomeCalculator takeHomeInstanceOne = new IncomeCalculator("SalaryTwo");%>

    <%takeHomeInstanceOne.calculateOldTakeHome();%>

    <%IncomeCalculator takeHomeInstanceTwo = new IncomeCalculator("SalaryOne");%>

    <%takeHomeInstanceTwo.calculateOldTakeHome();%>

    <%buildBalanceSheet totalInc = new buildBalanceSheet(takeHomeInstanceTwo.getmonthlyTakeHome(), takeHomeInstanceOne.getmonthlyTakeHome());%>
	
	<%ExpenseCalculator ExpenseInstanceOne = new ExpenseCalculator("Two", "Sal1");%>
    <%ExpenseCalculator ExpenseInstanceTwo = new ExpenseCalculator("One", "Sal1");%>
    <%DecimalFormat ft = new DecimalFormat("Rs ##,##,##0.00");%>
    <%DecimalFormat pc = new DecimalFormat("##,##,##0.00 %");%>
    <%RupeeFormatter rf = new RupeeFormatter();%>
    <%double nonDiscretionaryExpenses = (ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance() + 
                    ExpenseInstanceOne.getElectricityBill() + ExpenseInstanceTwo.getElectricityBill() +
                    ExpenseInstanceOne.getCreditCardBill() + ExpenseInstanceTwo.getCreditCardBill() +
                    ExpenseInstanceOne.getBrokerageMaintenance() + ExpenseInstanceTwo.getBrokerageMaintenance() +
                    ExpenseInstanceOne.getHomeInsurance() + ExpenseInstanceTwo.getHomeInsurance() +
                    ExpenseInstanceOne.getCashWithdrawals() + ExpenseInstanceTwo.getCashWithdrawals() +
                    ExpenseInstanceOne.getGroceryExpenses() + ExpenseInstanceTwo.getGroceryExpenses() +
                    ExpenseInstanceOne.getTravelExpense() + ExpenseInstanceTwo.getTravelExpense() +
                    ExpenseInstanceOne.getFamilyExpenses() + ExpenseInstanceTwo.getFamilyExpenses() + 
                    ExpenseInstanceOne.getShoppingExpense() + ExpenseInstanceTwo.getShoppingExpense() + 
                    ExpenseInstanceOne.getHousekeepingExpenses() + ExpenseInstanceTwo.getHousekeepingExpenses() + 
					ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses() +
					ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses() +
                    ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses())*ExpenseInstanceTwo.getMonthsBetween();%>

    <div>
        <h2 align=center>Personal Balance Sheet</h2>
        <table border=1; align=center>
            <col width="470"> 
            <col width="180"> 
            <col width="470"> 
            <col width="180"> 
            <tr><td align="center" colspan="2"><b>Asset</b></td>
                <td align="center" colspan="2"><b>Liability</b></td></tr>
				
            <tr><td align="left" colspan="2"><b>Liquid Assets</b></td>
                <td align="left" colspan="2"><b>Accrued Expenses</b></td></tr>
            
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[0].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[0].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[14].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[14].cashValueFmtd%></td>
            </tr>
            
			<tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[57].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[57].cashValueFmtd%></td>
                <td align="left" colspan="2"><b></b></td>
            </tr>
			
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[1].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[1].cashValueFmtd%></td>
                <td align="left" colspan="2"></td>
            </tr>
                        
            <tr><td align="left" colspan="2"><b><%= totalInc.chartOfAccountsList[4].subType%></b></td>
                <td align="left" colspan="2"><b><a href="http://localhost:8090/FinancialStatements/AccountsPayableAnnual.jsp"><%= totalInc.chartOfAccountsList[18].subType%></a></b></td>
            </tr>
            
			<tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[2].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[2].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[15].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[15].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[3].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[3].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[16].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[16].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[4].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[4].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[17].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[17].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[5].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[5].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[18].itemDescription%></td>
                <td align="right"><%= rf.formattedRupee(ft.format(nonDiscretionaryExpenses))%></td>
            </tr>
            
            <tr><td align="left" colspan="2"></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[19].itemDescription%></td>
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

            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[6].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[6].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[20].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[20].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[7].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[7].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[21].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[21].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[8].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[8].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[22].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[22].cashValueFmtd%></td>
            </tr>
            
            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[9].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[9].cashValueFmtd%></td>
                <td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[23].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[23].cashValueFmtd%></td>
            </tr>

            <tr><td align="left" colspan="2"><b><%= totalInc.chartOfAccountsList[10].subType%></b></td>
                <td align="left" colspan="2"></td>
            </tr>

            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[11].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[11].cashValueFmtd%></td>
                <td align="left" colspan="2"></td>
            </tr>

            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[12].itemDescription%></td>
                <td align="right"><%= totalInc.chartOfAccountsList[12].cashValueFmtd%></td>
                <td align="left" colspan="2"></td>
            </tr>

            <tr><td align="left" >&emsp;&emsp;<%= totalInc.chartOfAccountsList[13].itemDescription%></td>
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
			<tr>
                <td align="center" colspan="4"><b>Solvent till <%= totalInc.getSurvivalDateFmtd()%></b></td>
            </tr>
		</table>
		<table border=1; align=center>
        <col width="260"> 
        <col width="260"> 
        <col width="260"> 
        <col width="260"> 
		<col width="260"> 
			<tr><td align="center"><a href="http://localhost:8090/FinancialStatements/IncomeStatement.jsp" class="button button2">Income Statement</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp" class="button button2">Cash Flow Statement</td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp" class="button button2">Account Payables</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
				<td align="center"><a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp" class="button button2">Chart of Accounts</a></td>
			</tr>
			<tr><td align="center" colspan="3"><a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30" class="button button2">Financial Independence and Early Retirement</a></td>
				<td align="center" colspan="2"><a href="http://localhost:8090/FinancialStatements/ExpenseSplit.jsp" class="button button2">Expense Split</a></td>
			</tr>
		</table>
    </div>
</body>
</html>