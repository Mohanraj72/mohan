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
<sql:setDataSource var="mysqlds" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/test" user="root" password="root" />
	<sql:update var="Eastatus" dataSource="${mysqlds}">update dept set dept_name=?,start_date=? where dept_id='${param.dept_id}'
	<sql:param value="${param.dept_name}"></sql:param>
		<sql:param value="${param.start_date}"></sql:param>
	</sql:update>
	<core:if test="(${Eastatus}==0)">
	<core:out value="Error while inserting !!! pls check"></core:out>
	</core:if>
	<core:redirect url="read.jsp"></core:redirect>

</body>
</html>