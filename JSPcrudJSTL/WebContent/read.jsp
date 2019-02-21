<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Read page</title>
</head>
<body>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	
	<center>
		<h1>Department</h1>
		<table border='1' class="table table-hover table-dark">
			<tr align="center">
				<th >Sl.no</th>
				<th>dept_id</th>
				<th>dept_name</th>
				<th>start_date</th>
				<th>Actions</th>
			</tr>
			<% int i=0; %>
			<sql:setDataSource var="mysqlds" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost:3306/test" user="root" password="root" />
			<sql:query var="rs" dataSource="${mysqlds}">select * from dept</sql:query>
			<core:forEach items="${rs.rows}" var="dept">
			<tr>
			<td align="center"><core:out value="${i=i+1}"></core:out></td>
			<td align="center"><core:out value="${dept.dept_id}"></core:out></td>
			<td align="center"><core:out value="${dept.dept_name}"></core:out></td>
			<td align="center"><core:out value="${dept.start_date}"></core:out></td>
			<td align="center"><a href="edit.jsp?dept_id=${dept.dept_id}">Edit</a>||<a href="delete.jsp?dept_id=${dept.dept_id}">Delete</a></td>
			</tr>
			
			</core:forEach>
		</table>
	</center>
	<center><a href="index.jsp">Home_Page</a></center>
</body>
</html>