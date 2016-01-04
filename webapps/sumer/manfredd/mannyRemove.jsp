<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>

<sql:update dataSource="jdbc/manfreddsDB">
	delete from files where name = ?
	<sql:param value="${param.remover}"/>
</sql:update>

<jsp:forward page="mannysPhonyPage.jsp"/>