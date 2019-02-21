<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/test";
	Connection conn = DriverManager.getConnection(url, "root", "root");
	String usql = "update Trainee_detail set Branch=?,college_name=? where trainee_name=?";
	String tname = request.getParameter("tname");
	String dept = request.getParameter("dept");
	String clg = request.getParameter("clg");
	PreparedStatement pstmt = conn.prepareStatement(usql);
	pstmt.setString(3, tname);
	pstmt.setString(1, dept);
	pstmt.setString(2, clg);
	int updateStatus = 0;
	updateStatus = pstmt.executeUpdate();
	if (updateStatus == 0) {
		out.println("Error while updating the record !!!pls check.");
	} else {
		response.sendRedirect("read.jsp");
	}
} catch (Exception e) {
	out.println(e.getMessage());

}
%>

</body>
</html>