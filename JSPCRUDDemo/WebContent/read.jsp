<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.sun.org.apache.bcel.internal.util.Class2HTML"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Read</title>
</head>
<body>
	<a href="index.jsp">Home</a>
	<center>
		<h1>Trainee_Detail_Table_Content</h1>
		<table border='1'>
			<tr>
				<th>Sl.no</th>
				<th>Name</th>
				<th>Branch</th>
				<th>College_Name</th>
				<th>Actions</th>
			</tr>
			<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/test";
					Connection conn = DriverManager.getConnection(url, "root", "root");
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("select * from trainee_detail");
					int i = 0;
					while (rs.next()) {
			%>

			<tr>
				<td><%=++i%></td>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><a href="edit.jsp?trainee_name=<%=rs.getString(1)%>">Edit</a>
					| <a href="delete.jsp?trainee_name=<%=rs.getString(1)%>">Delete</a></td>
			</tr>

			<%
				}
					rs.close();
					stmt.close();
					conn.close();
			%>
		</table>
	</center>
	<%
		} catch (Exception e) {
			out.println(e.getMessage());

		}
	%>
</body>
</html>