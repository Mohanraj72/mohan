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
<title>Edit page</title>
</head>
<body>

<% 

                     deptDao deD = new deptDao();
Department dept=new Department();
                     dept.setDept_id(Integer.parseInt(request.getParameter("dept_id")));
                     dept.setDept_name(request.getParameter("dept_name"));
                     dept.setStart_date(request.getParameter("start_date"));
                     int Eastatus = 0;
                     Eastatus = deD.update(dept);
%>
	<core:if test="(${Eastatus}==0)">
	<core:out value="Error while inserting !!! pls check"></core:out>
	</core:if>
	<core:redirect url="read.jsp"></core:redirect>

</body>
</html>