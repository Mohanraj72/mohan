<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete page</title>
</head>
<body>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/test";
	Connection conn = DriverManager.getConnection(url, "root", "root");
	String trainee_name=request.getParameter("trainee_name");
	Statement stmt = conn.createStatement();
	int deleteStatus=0;
	deleteStatus= stmt.executeUpdate("delete from trainee_detail where trainee_name='"+trainee_name+"'");
	if(deleteStatus==0){
		out.println("Error while deleting the record !!!pls check.");
	}
	else{
		response.sendRedirect("read.jsp");
	}
}
catch (Exception e) {
	out.println(e.getMessage());

}
%>
</body>
</html>