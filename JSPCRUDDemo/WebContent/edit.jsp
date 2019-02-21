<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Page</title>
</head>
<body>
<a href="read.jsp">Read_Page</a>
	<center>
		<h1>Add a New record</h1>
	</center>
	<form action="editaction.jsp" method="get">
		<table align="center">
			<tr>
				<th>Column name</th>
				<th>value</th>
			</tr>
			<%
			String tname=request.getParameter("trainee_name");
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/test";
				Connection conn = DriverManager.getConnection(url, "root", "root");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select * from trainee_detail where trainee_name='"+tname+"'");
				int i=0;
				if(rs.next()) {
	
			
		%>

			<tr>
				<td>Trainee_Name:</td>
				<td><input type="text" name="tname" value="<%=rs.getString(1) %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>Branch:</td>
				<td><input type="text" name="dept" value="<%=rs.getString(2) %>"></td>
			</tr>
			<tr>
				<td>College_Name:</td>
				<td><input type="text" name="clg" value="<%=rs.getString(3) %>"></td>
			</tr>
			<tr>
			<td><input type="reset" value="Clear"></td>
			<td><input type="submit" value="Update"></td>
			<%
				}
				rs.close();
				stmt.close();
				conn.close();
			}catch (Exception e) {
				out.println(e.getMessage());

			}
			%>
		</table>
	</form>
</body>
</html>