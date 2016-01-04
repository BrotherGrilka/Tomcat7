<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>

<c:if test="${!empty param.aidan}">
	<sql:update dataSource="jdbc/manfreddsDB">
		insert into files values (?)
		<sql:param value="${param.mannysNewFile}"/>
	</sql:update>
</c:if>

<jsp:forward page="mannysPhonyPage.jsp"/>