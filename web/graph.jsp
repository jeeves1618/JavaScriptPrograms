<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("label", "Net Revenue"); map.put("y", 251631); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Inventory"); map.put("y", +97000); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Merchandise"); map.put("y", -9200); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Other Sales Cost"); map.put("y", -24990); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Gross Income"); map.put("isIntermediateSum", true); map.put("color", "#55646e"); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Staff"); map.put("y", -18500); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Marketing"); map.put("y", -3500); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Other Facilities"); map.put("y", -27100); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Operating Income"); map.put("isCumulativeSum", true); map.put("color", "#55646e"); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Taxes"); map.put("y", -12000); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Net Income"); map.put("isCumulativeSum", true); list.add(map);
 
String dataPoints = gsonObj.toJson(list);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {	
	animationEnabled: true,
	title:{
		text: " "
	},
	axisX:{
		labelMaxWidth: 75
	},
	axisY: {
		prefix: "$",
		includeZero: true
	},	
	data: [{
		type: "waterfall",
		yValueFormatString: "$#,##0",
		indexLabel: "{y}",
		risingColor: "#50cdc8",
		fallingColor: "#ff6969",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>