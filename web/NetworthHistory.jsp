<%@page import="ViewServices.*"%>
<%@page import="CommonModules.*"%>	
<%! int networthHistoryIterator;	 %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 
 <%
		ViewNetworthHistory viewNetworthHistory = new ViewNetworthHistory(); 
		NetworthHistory[] NetworthHistoryList = viewNetworthHistory.getNetworthHistory();
		ViewChartOfAccounts viewChartOfAccounts = new ViewChartOfAccounts();
		String herName = viewChartOfAccounts.getHerName();
		String hisName = viewChartOfAccounts.getHisName();
		Gson gsonObj = new Gson();
		Map<Object,Object> map = null;
		List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
		for (networthHistoryIterator = 0; networthHistoryIterator < NetworthHistory.numofElements; networthHistoryIterator++){ 
		map = new HashMap<Object,Object>(); map.put("label", NetworthHistoryList[networthHistoryIterator].valueDate); map.put("y", NetworthHistoryList[networthHistoryIterator].twoAmount); list.add(map);
		}
		String dataPoints1 = gsonObj.toJson(list);

		list = new ArrayList<Map<Object,Object>>();
		for (networthHistoryIterator = 0; networthHistoryIterator < NetworthHistory.numofElements; networthHistoryIterator++){ 
		map = new HashMap<Object,Object>(); map.put("label", NetworthHistoryList[networthHistoryIterator].valueDate); map.put("y", NetworthHistoryList[networthHistoryIterator].oneAmount); list.add(map);
		}
		String dataPoints2 = gsonObj.toJson(list);
		list = new ArrayList<Map<Object,Object>>();
		for (networthHistoryIterator = 0; networthHistoryIterator < NetworthHistory.numofElements; networthHistoryIterator++){ 
		map = new HashMap<Object,Object>(); map.put("label", NetworthHistoryList[networthHistoryIterator].valueDate); map.put("y", NetworthHistoryList[networthHistoryIterator].totalAmount); list.add(map);
		}
		String dataPoints3 = gsonObj.toJson(list);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Networth History</title>
<link rel="stylesheet" href="FinancialManagementStyle.css">
<script type="text/javascript">

window.onload = function() { 
var herName = "<%out.print(herName);%>";
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,	
	title: {
		text: " "
	},
	axisX: {
		title: "Date"
	},
	axisY: {
		title: "Networth (in Rupees)",
		labelFormatter: addSymbols
	},
	toolTip: {
		shared: true,
		reversed: true
	},
	legend: {
		verticalAlign: "center",
		horizontalAlign: "right",
		reversed: true,
		cursor: "pointer",
		itemclick: toggleDataSeries
	},
	data: [{
		type: "spline",
		name: "<%out.print(herName);%>" ,      
		showInLegend: true,
		yValueFormatString: "Rs ##,##,##0.00",
		dataPoints: <%out.print(dataPoints1);%>
	},{
		type: "spline",
		name: "<%out.print(hisName);%>",
		showInLegend: true,
		yValueFormatString: "Rs ##,##,##0.00",
		dataPoints: <%out.print(dataPoints2);%>
	},{
		type: "spline",
		name: "Total",
		showInLegend: true,
		yValueFormatString: "Rs ##,##,##0.00",
		dataPoints: <%out.print(dataPoints3);%>
	}]
});
chart.render();
 
function addSymbols(e) {
	console.log(e);
	var suffixes = ["", "K", " Crore", "B"];
	var order = Math.max(Math.floor(Math.log(e.value) / Math.log(1000)), 0);
 
	if (order > suffixes.length - 1)
		order = suffixes.length - 1;
 
	var suffix = suffixes[order];
	return CanvasJS.formatNumber(e.value / Math.pow(1000, order)/10) + suffix;
}
 
function toggleDataSeries(e) {
	if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	} else {
		e.dataSeries.visible = true;
	}
	e.chart.render();
}
 
}
</script>
</head>

<body>

   
	<h2 align=center>Networth History</h2>
	<table border=1; align=center>
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260"> 
			<col width="260">  
            <tr><td align="center"><a href="http://localhost:8090/FinancialStatements/" class="button button2">Balance Sheet</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp" class="button button2">Cash Flow Statement</a></td>
                <td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp" class="button button2">Account Payables</a></td>
				<td align="center" ><a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a></td>
                <td align="center"><a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp" class="button button2">Chart of Accounts</a></td>
            </tr>
			<tr><td align="center" colspan="1"><a href="http://localhost:8090/FinancialStatements/manageNLP.jsp" class="button button2">NLP Tokens</a></td>
				<td align="center" colspan="3"><a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30" class="button button2">Financial Independence and Early Retirement</a></td>
				<td align="center" colspan="1"><a href="http://localhost:8090/FinancialStatements/ExpenseSplit.jsp" class="button button2">Expense Split</a></td>
			</tr>
    </table>
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>  
   
    <div>        
        <table class="class2"border=1; align=center>
            <col width="221"> 
            <col width="250"> 
            <col width="250"> 
            <col width="250"> 
            <tr><td align="center"><b>Date</b></td>
                <td align="center" style="color: #0086b3;"><b><%= herName%></b></td>
				<td align="center" style="color: #cc0000;"><b><%= hisName%></b></td>
				<td align="center" style="color: #66cc00;"><b>Total</b></td>
			</tr>
            
			<%for (networthHistoryIterator = 0; networthHistoryIterator < NetworthHistory.numofElements; networthHistoryIterator++){ %>
				<tr><td align="center" ><%= NetworthHistoryList[networthHistoryIterator].valueDate%></td>
					<td align="right" style="padding-left:10px; color: #0086b3;"><%= NetworthHistoryList[networthHistoryIterator].twoAmountFmtd%></td>
					<td align="right" style="padding-left:10px; color: #cc0000;"><%= NetworthHistoryList[networthHistoryIterator].oneAmountFmtd%></td>
					<td align="right" style="padding-left:10px; color: #66cc00;"><%= NetworthHistoryList[networthHistoryIterator].totalAmountFmtd%></td>
				</tr>
            <%}%>
            </table>
    </div>	
	
</body>
</html>