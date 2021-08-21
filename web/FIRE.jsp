<%@page import="CommonModules.*"%>
<%@page import="CashFlowStatement.*"%>
<%@page import="IncomeStatement.*"%>
<%@page import="BalanceSheet.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*"%>
<%! int fireIterator, currentYear, moreYears; %>
<%! long twentyXtime = 0, twentyFiveXtime = 0, fiftyXtime = 0, seventyFiveXtime = 0, hundredXtime = 0, monthCalc = 0; %>
<%! double inflationRate, rateOfReturn, annualWithdrawals, netSavings, twentyX, twentyFiveX, fiftyX, seventyFiveX, hundredX, twentyXETA, networthGrowth;%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  
%>
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
	<% inflationRate = Double.parseDouble(request.getParameter("inflation_rate"));
	   rateOfReturn = Double.parseDouble(request.getParameter("return_rate"));
	   moreYears = Integer.parseInt(request.getParameter("more_years"));%>
	<%ExpenseCalculator ExpenseInstanceOne = new ExpenseCalculator("Two", "Sal1");%>
    <%ExpenseCalculator ExpenseInstanceTwo = new ExpenseCalculator("One", "Sal1");%>
    <%DecimalFormat ft = new DecimalFormat("Rs ##,##,##0.00");%>
	<%DecimalFormat mt = new DecimalFormat("##,##,##0.00");%>
    <%DecimalFormat pc = new DecimalFormat("##,##,##0.00 %");%>
    <%RupeeFormatter rf = new RupeeFormatter();%>
	
	<%IncomeCalculator takeHomeInstanceOne = new IncomeCalculator("SalaryTwo");%>

    <%takeHomeInstanceOne.calculateOldTakeHome();%>

    <%IncomeCalculator takeHomeInstanceTwo = new IncomeCalculator("SalaryOne");%>

    <%takeHomeInstanceTwo.calculateOldTakeHome();%>

    <%buildBalanceSheet totalInc = new buildBalanceSheet(takeHomeInstanceTwo.getmonthlyTakeHome(), takeHomeInstanceOne.getmonthlyTakeHome());%>
	<%double nonDiscretionaryInflationaryExpenses = (ExpenseInstanceOne.getApartmentMaintenance() + ExpenseInstanceTwo.getApartmentMaintenance() + 
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
					ExpenseInstanceOne.getEducationExpenses() + ExpenseInstanceTwo.getEducationExpenses() +
					ExpenseInstanceOne.getdHealthCareExpenses() + ExpenseInstanceTwo.getdHealthCareExpenses() +
                    ExpenseInstanceOne.getEntertainmentExpenses() + ExpenseInstanceTwo.getEntertainmentExpenses() 
                    );
		double nonDiscretionaryNonInflationaryExpenses = ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI();
		double nonDiscretionaryExpenses =nonDiscretionaryInflationaryExpenses + nonDiscretionaryNonInflationaryExpenses;%>
	<%double totalLiquidAssets = totalInc.getTotalLiquidAssets();
	  double totalLiquidAssetsROR1 = totalLiquidAssets;
	  double totalLiquidAssetsROR2 = totalLiquidAssets;
	  double totalLiquidAssetsROR3 = totalLiquidAssets;	  
	  networthGrowth = totalLiquidAssets;	  
	  long monthsInBetween = ExpenseInstanceOne.getMonthsBetween();
	  currentYear = Calendar.getInstance().get(Calendar.YEAR);
	  double netSavings = totalInc.getNetSavings();
	  double netSavingsGrowth = netSavings;
	  twentyX = 20 * nonDiscretionaryExpenses * monthsInBetween;
	  twentyFiveX = 25 * nonDiscretionaryExpenses * monthsInBetween; 
	  fiftyX = 50 * nonDiscretionaryExpenses * monthsInBetween; seventyFiveX = 75 * nonDiscretionaryExpenses * monthsInBetween; hundredX = 100 * nonDiscretionaryExpenses * monthsInBetween;
	  double twentyXETA = (hundredX - totalLiquidAssets)/(netSavings*monthsInBetween);
	  twentyXtime = 0; twentyFiveXtime = 0; fiftyXtime = 0; seventyFiveXtime = 0; hundredXtime = 0; monthCalc = 0; 
	   
	  while (networthGrowth <= hundredX)
	  {	
		  if (monthCalc == 12)
		  {
			  networthGrowth = networthGrowth * (1+(rateOfReturn/100));
			  netSavingsGrowth = netSavingsGrowth * (1+(inflationRate/100));
			  networthGrowth = networthGrowth + netSavingsGrowth;
			  monthCalc = 0; 
		  }
		  else
		  {
			  networthGrowth = networthGrowth + netSavingsGrowth;
		  }
		  
		  fireIterator++;
		  monthCalc++;
		  if (twentyXtime == 0 && networthGrowth > twentyX)
			  twentyXtime = fireIterator;
		  else if (twentyFiveXtime == 0 && networthGrowth > twentyFiveX)
			  twentyFiveXtime = fireIterator;
		  else if (fiftyXtime == 0 && networthGrowth > fiftyX)
			  fiftyXtime = fireIterator;
		  else if (seventyFiveXtime == 0 && networthGrowth > seventyFiveX)
			  seventyFiveXtime = fireIterator;
		  else if (hundredXtime == 0 && networthGrowth > hundredX)
			  hundredXtime = fireIterator;
	  }
	  %>
    <div>
        <h2 align=center>Financial Independence and Retiring Early</h2>
        </table>
			<table border=1; align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
				<tr><td align="center"><a href="http://localhost:8080/FinancialStatements/" class="button button2">Balance Sheet</a></td>
					<td align="center"><a href="http://localhost:8080/FinancialStatements/NetworthHistory.jsp" class="button button2">Networth History</a></td>
					<td align="center" ><a href="http://localhost:8080/FinancialStatements/AccountsPayable.jsp" class="button button2">Account Payables</a></td>
					<td align="center" ><a href="http://localhost:8080/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
					<td align="center"><a href="http://localhost:8080/FinancialStatements/chartOfAccounts.jsp" class="button button2">Chart of Accounts</a></td>
				</tr>
				<tr><td align="center" colspan="3"><a href="http://localhost:8080/FinancialStatements/CashFlowStatement.jsp" class="button button2">Cash Flow Statement</a></td>
					<td align="center" colspan="2"><a href="http://localhost:8080/FinancialStatements/ExpenseSplit.jsp" class="button button2">Expense Split</a></td>
				</tr>
        </table> 
		 
        <table border=1; align=center>
            <col width="944"> 
            <col width="360"> 
			          
            <tr><td align="center" colspan="2"><b><%= ExpenseInstanceOne.getTimePeriod()%></b></td></tr>
            <tr><td align="left" ><div class="tooltip">Annual Non Discretionary Expenses<span class="tooltiptext">All non discretionary expenses as of today are included</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(nonDiscretionaryExpenses * monthsInBetween))%>&emsp;</td></tr>
			<tr><td align="left" ><div class="tooltip">Monthly Non Discretionary Expenses<span class="tooltiptext">All non discretionary expenses as of today are included</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(nonDiscretionaryExpenses))%>&emsp;</td></tr>
			
            
			<tr><td align="left" ><div class="tooltip">Networth (Liquid Assets)<span class="tooltiptext">This includes the assets that can be liquidated</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(totalLiquidAssets))%>&emsp;</td>
				</tr>
			<tr><td align="left" ><div class="tooltip">Networth in Multiples of Discretionary Expenses <span class="tooltiptext">This basically tells how many more times of annual non discretionary expenses is the networth</span></div></td>
                <td align="right"><%= mt.format(totalInc.getTotalLiquidAssets()/(nonDiscretionaryExpenses * monthsInBetween))%>X&emsp;</td>
				</tr>
			<tr><td align="left" ><div class="tooltip"><span class="tooltiptext">This line is intentionally left blank</span></div></td>
                <td align="right"></td>
				</tr>
			<tr><td align="left" ><div class="tooltip">Inflation Rate<span class="tooltiptext">Inflation in India. Try to use a value close to CPI inflation rate.</span></div></td>
                <td align="right">
					<form action="http://localhost:8080/FinancialStatements/FIRE.jsp">					
					  <select name="inflation_rate" id="inflation_rate">
						<option value=2.0>2</option>
						<option value=3.0>3</option>
						<option value=4.0>4</option>
						<option value=5.0>5</option>
						<option value=6.0 selected>6</option>
						<option value=7.0>7</option>
						<option value=8.0>8</option>
						<option value=9.0>9</option>
						<option value=10.0>10</option>
					  </select>		
					  <input type="submit" value="Recalculate"> &emsp;						
				</td>
				</tr>
			<tr><td align="left" ><div class="tooltip">Rate of Return<span class="tooltiptext">Reports the flow of money into and out of business from making and selling of products. It is a good measure of how well a business is able to raise cash through operations</span></div></td>
                <td align="right">								
					  <select name="return_rate" id="return_rate">
						<option value=1.0>1</option>
						<option value=2.0>2</option>
						<option value=3.0>3</option>
						<option value=4.0>4</option>
						<option value=5.0>5</option>
						<option value=6.0>6</option>
						<option value=7.0>7</option>
						<option value=8.0 selected>8</option>
						<option value=9.0>9</option>
						<option value=10.0>10</option>
					  </select>	
					  <input type="submit" value="Recalculate">	&emsp;
					
				</td>
				</tr>
			<tr><td align="left" ><div class="tooltip">Current Withdrawal Rate<span class="tooltiptext">Reports the flow of money into and out of business from making and selling of products. It is a good measure of how well a business is able to raise cash through operations</span></div></td>
                <td align="right"><b><%= pc.format((nonDiscretionaryExpenses * monthsInBetween)/totalLiquidAssets)%>&emsp;</b></td>
				</tr>
			<tr><td align="left" ><div class="tooltip">Expected Annual Spending based on the Industry Standard Withdrawal Rate of 4%<span class="tooltiptext">For this networth the monthly expenses should be restricted to this amount</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(.04*totalInc.getTotalLiquidAssets()))%>&emsp;</td>
				</tr>
			<tr><td align="left" ><div class="tooltip">Expected Monthly Spending based on the Industry Standard Withdrawal Rate of 4%<span class="tooltiptext">For this networth the monthly expenses should be restricted to this amount</span></div></td>
                <td align="right"><%= rf.formattedRupee(ft.format(.04*totalInc.getTotalLiquidAssets()/monthsInBetween))%>&emsp;</td>
				</tr>
			<tr><td align="left" ><div class="tooltip">How many more years you expect to live?<span class="tooltiptext">The finances should be planned for the lifetime after the retirement</span></div></td>
                <td align="right"><b> <select name="more_years" id="more_years">
						<option value=25>25</option>
						<option value=26>26</option>
						<option value=27>27</option>
						<option value=28>28</option>
						<option value=29>29</option>
						<option value=30 selected>30</option>
						<option value=31>31</option>
						<option value=32>32</option>
						<option value=33>33</option>
						<option value=34>34</option>
						<option value=35>35</option>
						<option value=36>36</option>
						<option value=37>37</option>
						<option value=38>38</option>
						<option value=39>39</option>
						<option value=40>40</option>
					  </select>	
					  <input type="submit" value="Recalculate">	&emsp;</b></td>
					  </form
				</tr> 
		</table>
		<table border=1; align=center>
            <col width="620"> 
            <col width="245"> 
			<col width="245"> 
            <col width="190"> 
			<tr><td align="center"><b>Milestones at a return of <%= rateOfReturn%>% and an inflation of <%= inflationRate%>%</b></td><td align="center"><b>Target Networth</b></td><td align="center"><b>Networth Shortfall</b></td><td align="center"><b>Expected Date</b></td></tr>
			<tr><td align="left">Target Networth, Shortfall and Expected date for achieving 20X</td>
				<td align="right"><%= rf.formattedRupee(ft.format(twentyX))%>&emsp;</b></td>
				<td align="right"><%= rf.formattedRupee(ft.format(twentyX - totalLiquidAssets ))%>&emsp;</b></td>
				<td align="center"><%= LocalDate.now().plusMonths(twentyXtime) %>&emsp;</td>
			</tr>
			<tr><td align="left">Target Networth, Shortfall and Expected date for achieving 25X</td>
				<td align="right"><%= rf.formattedRupee(ft.format(twentyFiveX))%>&emsp;</b></td>
				<td align="right"><%= rf.formattedRupee(ft.format(twentyFiveX - totalLiquidAssets ))%>&emsp;</b></td>
				<td align="center"><%= LocalDate.now().plusMonths(twentyFiveXtime) %>&emsp;</td>
			</tr>
			<tr><td align="left">Target Networth, Shortfall and Expected date for achieving 50X</td>
				<td align="right"><%= rf.formattedRupee(ft.format(fiftyX))%>&emsp;</b></td>
				<td align="right"><%= rf.formattedRupee(ft.format(fiftyX - totalLiquidAssets ))%>&emsp;</b></td>
				<td align="center"><%= LocalDate.now().plusMonths(fiftyXtime) %>&emsp;</td>
			</tr>
			<tr><td align="left">Target Networth, Shortfall and Expected date for achieving 75X</td>
				<td align="right"><%= rf.formattedRupee(ft.format(seventyFiveX))%>&emsp;</b></td>
				<td align="right"><%= rf.formattedRupee(ft.format(seventyFiveX - totalLiquidAssets ))%>&emsp;</b>
				</td><td align="center"><%= LocalDate.now().plusMonths(seventyFiveXtime) %>&emsp;</td>
			</tr>
			<tr><td align="left">Target Networth, Shortfall and Expected date for achieving 100X</td>
				<td align="right"><%= rf.formattedRupee(ft.format(hundredX))%>&emsp;</b></td>
				<td align="right"><%= rf.formattedRupee(ft.format(hundredX - totalLiquidAssets ))%>&emsp;</b></td>
				<td align="center"><%= LocalDate.now().plusMonths(hundredXtime) %>&emsp;</td>
			</tr>				 
		</table>
		<table border=1; align=center>
            <col width="125"> 
            <col width="245"> 
            <col width="310"> 
			<col width="310">
			<col width="310">
            <tr><td align="center"><b>Year</b></td>
                <td align="center"><b>Withdrawal@<%= inflationRate%>% Inflation</b></td>
				<td align="center"><b>Remaining Networth @ <%= rateOfReturn%>%</b></td>
				<td align="center"><b>Remaining Networth @ <%= rateOfReturn + 2%>%</b></td>
				<td align="center"><b>Remaining Networth @ <%= rateOfReturn + 4%>%</b></td>
			</tr>
            
			<%for (fireIterator = 0; fireIterator < moreYears; fireIterator++){ 
				annualWithdrawals = (nonDiscretionaryInflationaryExpenses * Math.pow((1+((inflationRate + 0)/100)),fireIterator) + nonDiscretionaryNonInflationaryExpenses)* monthsInBetween;	
				totalLiquidAssetsROR1 = totalLiquidAssetsROR1 - annualWithdrawals;
				totalLiquidAssetsROR2 = totalLiquidAssetsROR2 - annualWithdrawals;	
				totalLiquidAssetsROR3 = totalLiquidAssetsROR3 - annualWithdrawals;				
				%>				
				<tr><td align="center" ><%= currentYear++%></td>
					<td align="right" style="padding-left:10px"><%= rf.formattedRupee(ft.format(annualWithdrawals))%>&emsp;</td>
					<td align="right" style="padding-left:10px"><%= rf.formattedRupee(ft.format(totalLiquidAssetsROR1))%>&emsp;</td>	
					<td align="right" style="padding-left:10px"><%= rf.formattedRupee(ft.format(totalLiquidAssetsROR2))%>&emsp;</td>
					<td align="right" style="padding-left:10px"><%= rf.formattedRupee(ft.format(totalLiquidAssetsROR3))%>&emsp;</td>
				</tr>
            <%totalLiquidAssetsROR1 = totalLiquidAssetsROR1 * (1+((rateOfReturn + 0)/100));
			  totalLiquidAssetsROR2 = totalLiquidAssetsROR2 * (1+((rateOfReturn + 2)/100));
			  totalLiquidAssetsROR3 = totalLiquidAssetsROR3 * (1+((rateOfReturn + 4)/100));}%>
            </table>
    </div> 
	
	
</body>
</html>