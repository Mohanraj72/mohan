<%@page import="com.cts.Department"%>
<%@page import="com.ctss.deptDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Page</title>
</head>
<body>
	
	<center>
		<h1>Add a New record</h1>
		<form action="editaction.jsp">
	</center>
	
	<%
                     deptDao deD = new deptDao();
                     Department dept= deD.read(Integer.parseInt(request.getParameter("dept_id")));
              %>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<table class="table table-striped" align="center">
			<tr>
				<th>Column name</th>
				<th>value</th>
			</tr>
			<tr>
				<td>dept_id::</td>
				<td><input type="number" name="dept_id" value="<%= dept.getDept_id()%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>dept_name:</td>
				<td><input type="text" name="dept_name" value="<%= dept.getDept_name()%>"></td>
			</tr>
			<tr>
				<td>start_date:</td>
				<td><input type="date" name="start_date" value="<%= dept.getStart_date()%>"></td>
			</tr>
			<tr>
				<td><input type="reset" value="Clear"></td>
				<td><input type="submit" value="Update"></td>
		</table>
	</form>
	<center>
	<a href="read.jsp">Read_Page</a></center>
</body>
</html>