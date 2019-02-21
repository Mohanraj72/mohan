<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Record</title>
</head>
<body>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test";
			Connection conn = DriverManager.getConnection(url, "root", "root");
			String trainee_name = request.getParameter("trainee_name");
			String sql = "insert into trainee_detail values (?,?,?)";
			String tname = request.getParameter("tname");
			String dept = request.getParameter("dept");
			String clg = request.getParameter("clg");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tname);
			pstmt.setString(2, dept);
			pstmt.setString(3, clg);
			int insertStatus = 0;
			insertStatus = pstmt.executeUpdate();
			if (insertStatus == 0) {
				out.println("Error while inserting the record !!!pls check.");
			} else {
				response.sendRedirect("read.jsp");
			}
		} catch (Exception e) {
			out.println(e.getMessage());

		}
	%>
</body>
</html>