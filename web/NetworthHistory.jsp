<%@page import="ViewServices.*"%>
<%@page import="CommonModules.*"%>	
<%@page import="admin.*"%>
<%! int networthHistoryIterator;	 %>
<%String operation = request.getParameter("operation");
int serialNumber;
%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 
 <%
		String currencyFormat = new CurrencyCustomization().getCurrencyFormat();
		ViewNetworthHistory viewNetworthHistory = new ViewNetworthHistory(); 
		if (operation.equals("Add Entry")||operation.equals("Update")){
			serialNumber = Integer.parseInt(request.getParameter("sNo"));
			String datetime = request.getParameter("dateTime");
			double twoAmount = Double.parseDouble(request.getParameter("twoAmount"));
			double oneAmount = Double.parseDouble(request.getParameter("oneAmount"));
			viewNetworthHistory.updateHistoryEntry(serialNumber,twoAmount,oneAmount,datetime);
		} else if (operation.equals("Delete"))
		{
			serialNumber = Integer.parseInt(request.getParameter("sNo"));
			viewNetworthHistory.deleteHistoryEntry(serialNumber);
		}
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
<title>Regularly Traded Assets History</title>
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
		yValueFormatString: "<%out.print(currencyFormat);%>" ,
		dataPoints: <%out.print(dataPoints1);%>
	},{
		type: "spline",
		name: "<%out.print(hisName);%>",
		showInLegend: true,
		yValueFormatString: "<%out.print(currencyFormat);%>" ,
		dataPoints: <%out.print(dataPoints2);%>
	},{
		type: "spline",
		name: "Total",
		showInLegend: true,
		yValueFormatString: "<%out.print(currencyFormat);%>" ,
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

   
	<h2 align=center>Regularly Traded Assets History</h2>
	<div class="topnav">
		<a href="http://localhost:8090/FinancialStatements/">Balance Sheet</a>
		<a href="http://localhost:8090/FinancialStatements/AccountsPayable.jsp">Account Payables</a>
		<a href="http://localhost:8090/FinancialStatements/AccountsReceivable.jsp">Account Receivables</a>
		<a href="http://localhost:8090/FinancialStatements/admin.jsp?operation=View">Personalization</a>
		<a class="active" href="http://localhost:8090/FinancialStatements/NetworthHistory.jsp?operation=View">Tradeable Assets</a>
		<a href="http://localhost:8090/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30">F.I.R.E</a>
		<a href="http://localhost:8090/FinancialStatements/chartOfAccounts.jsp">Chart of Accounts</a>
		<a href="http://localhost:8090/FinancialStatements/manageNLP.jsp">NLP Processor</a>
		<a href="http://localhost:8090/FinancialStatements/CashFlowStatement.jsp">Cash Flow</a>
		<a href="http://localhost:8090/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown">Unknown Transactions</a>
		</div>
		&nbsp;
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>  
   
    <div>        
        <table class="class2"border=1; align=center>
			<col width="40">
            <col width="221"> 
            <col width="250"> 
            <col width="250"> 
            <col width="250"> 
			<col width="200">
            <tr><td align="center"><b>S.No</b></td>
				<td align="center"><b>Date</b></td>
                <td align="center" style="color: #0086b3;"><b><%= herName%></b></td>
				<td align="center" style="color: #cc0000;"><b><%= hisName%></b></td>
				<td align="center" style="color: #66cc00;"><b>Total</b></td>
				<td align="center"><b>Actions</b></td>
			</tr>
            
			<%for (networthHistoryIterator = 0; networthHistoryIterator < NetworthHistory.numofElements; networthHistoryIterator++){ %>
				
				<tr><td align="center" ><%= NetworthHistoryList[networthHistoryIterator].serialNumber%></td>
					<td align="center" ><%= NetworthHistoryList[networthHistoryIterator].valueDate%></td>
					<td align="right" style="padding-left:10px; color: #0086b3;"><%= NetworthHistoryList[networthHistoryIterator].twoAmountFmtd%></td>
					<td align="right" style="padding-left:10px; color: #cc0000;"><%= NetworthHistoryList[networthHistoryIterator].oneAmountFmtd%></td>
					<td align="right" style="padding-left:10px; color: #66cc00;"><%= NetworthHistoryList[networthHistoryIterator].totalAmountFmtd%></td>
					<td align="center" style="padding-left:0px"><b><form action="http://localhost:8090/FinancialStatements/AddUpdateDeleteNW.jsp?sNo=<%= NetworthHistoryList[networthHistoryIterator].serialNumber%>
								&dateTime=<%= NetworthHistoryList[networthHistoryIterator].valueDate%>&twoAmount=<%= NetworthHistoryList[networthHistoryIterator].twoAmount%>
								&oneAmount=<%= NetworthHistoryList[networthHistoryIterator].oneAmount%>&operation=Update" method="POST"><input type="submit" value="Update Entry"></form>&nbsp;<form action="http://localhost:8090/FinancialStatements/AddUpdateDeleteNW.jsp?sNo=<%= NetworthHistoryList[networthHistoryIterator].serialNumber%>&operation=Delete"method="POST"><input type="submit" value="Delete Entry"></form></td></b></td>
				</tr>
				
            <%}%>
            </table>
			<table border=1; align=center>
			<col width="1225"> 
			<tr><td align="center"><form action="http://localhost:8090/FinancialStatements/AddUpdateDeleteNW.jsp?sNo=<%= networthHistoryIterator%>&operation=Add Entry" method="POST"><input type="submit" value="Add Entry"></form>
			</tr></table>
    </div>	
	
</body>
</html>