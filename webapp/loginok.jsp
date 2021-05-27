<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--  properties에 있는 값 불러오기 -->
<fmt:setBundle basename="hi-choi.jdbc"/>
<fmt:message key="url" var="url"/>
<fmt:message key="drv" var="drv"/>
<fmt:message key="usr" var="usr"/>
<fmt:message key="pwd" var="pwd"/>

<!--  DB 호출 -->
<sql:setDataSource url="${url}" driver="${drv}" user="${usr}" password="${pwd}" var="mariadb"/>

<!--  DB사용하지 않고 기본 설정된 값과 비교-->
<%-- <c:if test="${param.userid eq 'abc123' and param.passwd eq '987xyz'}">
	<script>location.href="myinfo.jsp";</script>
</c:if>

<c:if test="${param.userid ne 'abc123' or param.passwd ne '987xyz'}">
	<script>
		alert('로그인 실패!');
		location.href="login.jsp";</script>
</c:if> --%>

<!--  DB에 있는 값과 비교 -->
<sql:query var="rs" dataSource="${mariadb}">
	select count(name) cnt from member where userid = ? and passwd = ?
	<sql:param value="${param.userid}"/>
	<sql:param value="${param.passwd}"/>
</sql:query>

<c:forEach var="row" items="${rs.rows}">
	<c:if test="${row.cnt gt 0}">
		<c:set var="userid" value="${param.userid}" scope="session"/>
		<script>location.href="myinfo.jsp";</script>
	</c:if>
	<c:if test="${row.cnt eq 0}">
		<script>
			alert('로그인 실패!');
			location.href="login.jsp";</script>
	</c:if>
</c:forEach>