<%@page import="CommonModules.*"%>
<%@page import="CashFlowStatement.*"%>
<%@page import="IncomeStatement.*"%>
<%@page import="BalanceSheet.*"%>
<%@page import="ViewServices.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*"%>
<%@page import="admin.*"%>
<%! int fireIterator, currentYear, moreYears; %>
<%! long twentyXtime = 0, twentyFiveXtime = 0, fiftyXtime = 0, seventyFiveXtime = 0, hundredXtime = 0, monthCalc = 0; %>
<%! double inflationRate, rateOfReturn, annualWithdrawals, netSavings, twentyX, twentyFiveX, fiftyX, seventyFiveX, hundredX, twentyXETA, networthGrowth;
	boolean twentyXpast, twentyFiveXpast, fiftyXpast, seventyFiveXpast, hundredXpast;%>
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
<link rel="stylesheet" href="FinancialManagementStyle.css">
<title>Personal Financial Statement</title>
</head>
<body>
    <div>
        <h2 align=center>Financial Independence and Retiring Early</h2>
        
		<table border=1; align=center>
        <col width="260"> 
        <col width="260"> 
        <col width="260"> 
        <col width="260"> 
		<col width="260"> 
			<tr><td align="center"><a href="http://localhost:8090/FinancialStatements/" class="button button2">Balance Sheet</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp" class="button button2">Account Payables</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
				<td align="center" colspan="1"><a href="http://localhost:8090/FinancialStatements/admin.jsp?operation=View" class="button button2">Personalization</a></td>
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
	<% inflationRate = Double.parseDouble(request.getParameter("inflation_rate"));
	   rateOfReturn = Double.parseDouble(request.getParameter("return_rate"));
	   moreYears = Integer.parseInt(request.getParameter("more_years"));%>
	<%ExpenseCalculator ExpenseInstanceOne = new ExpenseCalculator("Two", "Sal1");%>
    <%ExpenseCalculator ExpenseInstanceTwo = new ExpenseCalculator("One", "Sal1");%>
    <%String currencyFormat = new CurrencyCustomization().getCurrencyFormat();
	  DecimalFormat ft = new DecimalFormat(currencyFormat);%>
	<%DecimalFormat mt = new DecimalFormat("##,##,##0.00");%>
    <%DecimalFormat pc = new DecimalFormat("##,##,##0.00 %");%>
    <%RupeeFormatter rf = new RupeeFormatter();%>
	
	<%ViewChartOfAccounts viewChartOfAccounts = new ViewChartOfAccounts();
		String herName = viewChartOfAccounts.getHerName();
		String hisName = viewChartOfAccounts.getHisName();%>
    <%IncomeCalculator takeHomeInstanceOne = new IncomeCalculator(herName + "'s salary");%>

    <%IncomeCalculator takeHomeInstanceTwo = new IncomeCalculator(hisName + "'s salary");%>


    <%buildBalanceSheet totalInc = new buildBalanceSheet(takeHomeInstanceTwo.calculateOldTakeHome(), takeHomeInstanceOne.calculateOldTakeHome());%>
	<%long monthsInBetween = ExpenseInstanceOne.getMonthsBetween();
	  double nonDiscretionaryInflationaryExpenses = (ExpenseInstanceOne.getTotalNonDiscretionExpenses() + ExpenseInstanceTwo.getTotalNonDiscretionExpenses())/12;
	  double nonDiscretionaryNonInflationaryExpenses = ExpenseInstanceOne.getMonthlyEMI() + ExpenseInstanceTwo.getMonthlyEMI();
	  double nonDiscretionaryExpenses =nonDiscretionaryInflationaryExpenses + nonDiscretionaryNonInflationaryExpenses;%>
	<%double totalLiquidAssets = totalInc.getTotalLiquidAssets();
	  double totalLiquidAssetsROR1 = totalLiquidAssets;
	  double totalLiquidAssetsROR2 = totalLiquidAssets;
	  double totalLiquidAssetsROR3 = totalLiquidAssets;	  
	  networthGrowth = totalLiquidAssets;	  
	  
	  currentYear = Calendar.getInstance().get(Calendar.YEAR);
	  double netSavings = totalInc.getNetSavings();
	  double netSavingsGrowth = netSavings;
	  twentyX = 20 * nonDiscretionaryExpenses * monthsInBetween;
	  twentyFiveX = 25 * nonDiscretionaryExpenses * monthsInBetween; 
	  fiftyX = 50 * nonDiscretionaryExpenses * monthsInBetween; seventyFiveX = 75 * nonDiscretionaryExpenses * monthsInBetween; hundredX = 100 * nonDiscretionaryExpenses * monthsInBetween;
	  double twentyXETA = (hundredX - totalLiquidAssets)/(netSavings*monthsInBetween);
	  twentyXtime = 0; twentyFiveXtime = 0; fiftyXtime = 0; seventyFiveXtime = 0; hundredXtime = 0; monthCalc = 0;
	  twentyXpast = false; twentyFiveXpast = false; fiftyXpast = false; seventyFiveXpast = false; hundredXpast = false;
	   
	  while (networthGrowth <= hundredX)
	  {	
		  if (networthGrowth > twentyX) twentyXpast = false;
		  if (networthGrowth > twentyFiveX) twentyFiveXpast = false;
		  if (networthGrowth > fiftyX) fiftyXpast = false;
		  if (networthGrowth > seventyFiveX) seventyFiveXpast = false;
		  if (networthGrowth > hundredX) hundredXpast = false;
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
	  if (twentyXpast == true) twentyXtime = 0;
	  if (twentyFiveXpast == true) twentyFiveXtime = 0;
	  if (fiftyXpast == true) fiftyXtime = 0;
	  if (seventyFiveXpast == true) seventyFiveXtime = 0;
	  if (hundredXpast == true) hundredXtime = 0;
	  %> 
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
					<form action="http://localhost:8090/FinancialStatements/FIRE.jsp">					
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
					  </form>
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
				<td align="right"><%= rf.formattedRupee(ft.format(Math.max((twentyX - totalLiquidAssets ),0.0)))%>&emsp;</b></td>
				<td align="center"><%= LocalDate.now().plusMonths(twentyXtime) %>&emsp;</td>
			</tr>
			<tr><td align="left">Target Networth, Shortfall and Expected date for achieving 25X</td>
				<td align="right"><%= rf.formattedRupee(ft.format(twentyFiveX))%>&emsp;</b></td>
				<td align="right"><%= rf.formattedRupee(ft.format(Math.max((twentyFiveX - totalLiquidAssets ),0.0)))%>&emsp;</b></td>
				<td align="center"><%= LocalDate.now().plusMonths(twentyFiveXtime) %>&emsp;</td>
			</tr>
			<tr><td align="left">Target Networth, Shortfall and Expected date for achieving 50X</td>
				<td align="right"><%= rf.formattedRupee(ft.format(fiftyX))%>&emsp;</b></td>
				<td align="right"><%= rf.formattedRupee(ft.format(Math.max((fiftyX - totalLiquidAssets),0.0)))%>&emsp;</b></td>
				<td align="center"><%= LocalDate.now().plusMonths(fiftyXtime) %>&emsp;</td>
			</tr>
			<tr><td align="left">Target Networth, Shortfall and Expected date for achieving 75X</td>
				<td align="right"><%= rf.formattedRupee(ft.format(seventyFiveX))%>&emsp;</b></td>
				<td align="right"><%= rf.formattedRupee(ft.format(Math.max((seventyFiveX - totalLiquidAssets),0.0)))%>&emsp;</b>
				</td><td align="center"><%= LocalDate.now().plusMonths(seventyFiveXtime) %>&emsp;</td>
			</tr>
			<tr><td align="left">Target Networth, Shortfall and Expected date for achieving 100X</td>
				<td align="right"><%= rf.formattedRupee(ft.format(hundredX))%>&emsp;</b></td>
				<td align="right"><%= rf.formattedRupee(ft.format(Math.max((hundredX - totalLiquidAssets),0.0)))%>&emsp;</b></td>
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