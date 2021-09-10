<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  margin: auto;
  width: 85%;
  font-family: Arial, Helvetica, sans-serif;
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
</head>
<body>
<div class="topnav">
<a class="active" href="http://localhost:8080/FinancialStatements/" class="button button2">Balance Sheet</a>
<a href="http://localhost:8080/FinancialStatements/AccountsPayable.jsp" class="button button2">Account Payables</a>
<a href="http://localhost:8080/FinancialStatements/AccountsReceivable.jsp" class="button button2">Account Receivables</a>
<a href="http://localhost:8080/FinancialStatements/admin.jsp?operation=View" class="button button2">Personalization</a>
<a href="http://localhost:8080/FinancialStatements/NetworthHistory.jsp?operation=View" class="button button2">Tradeable Assets</a>
<a href="http://localhost:8080/FinancialStatements/FIRE.jsp?inflation_rate=6&return_rate=8&more_years=30" class="button button2">F.I.R.E</a>
<a href="http://localhost:8080/FinancialStatements/chartOfAccounts.jsp" class="button button2">Chart of Accounts</a>
<a href="http://localhost:8080/FinancialStatements/manageNLP.jsp" class="button button2">NLP Processor</a>
<a href="http://localhost:8080/FinancialStatements/CashFlowStatement.jsp" class="button button2">Cash Flow Statement
<a href="http://localhost:8080/FinancialStatements/UnknownTransactions.jsp?entry_category=Unknown" class="button button3">Unknown Transactions</a>

</div>



<div style="padding-left:16px">
  <h2>Top Navigation Example</h2>
  <p>Some content..</p>
</div>

</body>
</html>
