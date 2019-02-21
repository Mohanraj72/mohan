<%@page import="com.ctss.deptDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Page</title>
</head>
<body>
<%
	deptDao deD=new deptDao();
int status=0;
status=deD.delete(Integer.parseInt(request.getParameter("dept_id")));
if(status==0){
       out.println("Error While Inserting data !!! pls Check");
}
else
{
       response.sendRedirect("read.jsp");
}
%>
</body>
</html>