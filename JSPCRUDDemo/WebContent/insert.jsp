<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert</title>
</head>
<body>
<a href="index.jsp">Home_Page</a>
	<center>
		<h1>Add a New record</h1>
	</center>
	<form action="insertaction.jsp" method="get">
		<table align="center">
			<tr>
				<th>Column name</th>
				<th>value</th>
			</tr>
			<tr>
				<td>Trainee_Name:</td>
				<td><input type="text" name="tname" required="required" placeholder="Trainee_Name"></td>
			</tr>
			<tr>
				<td>Branch:</td>
				<td><input type="text" name="dept" required="required" placeholder="Branch"></td>
			</tr>
			<tr>
				<td>College_Name:</td>
				<td><input type="text" name="clg" required="required" placeholder="College_Name"></td>
			</tr>
			<tr>
			<td><input type="reset" value="Clear"></td>
			<td><input type="submit" value="Insert"></td>
		</table>
	</form>
</body>
</html>