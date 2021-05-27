<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 한글 깨짐 방지 -->
<fmt:requestEncoding value="utf-8"/>

<!--  properties에 있는 값 불러오기 -->
<fmt:setBundle basename="hi-choi.jdbc"/>
<fmt:message key="url" var="url"/>
<fmt:message key="drv" var="drv"/>
<fmt:message key="usr" var="usr"/>
<fmt:message key="pwd" var="pwd"/>

<!--  DB 호출 -->
<sql:setDataSource url="${url}" driver="${drv}" user="${usr}" password="${pwd}" var="mariadb"/>

<!--  DB에 값 반영 -->
<sql:update var="rs" dataSource="${mariadb}">
	insert into board (title, userid, contents) values(?,?,?)
	<sql:param value="${param.title}"/>
	<sql:param value="${sessionScope.userid}"/>
	<sql:param value="${param.contents}"/>
</sql:update>

<c:if test="${rs gt 0}">
	<c:redirect url="/board/list.jsp"/>
</c:if>

<c:if test="${rs eq 0}">
	<script>history.go(-1);</script>
</c:if>

<%-- <!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 등록결과</title>
</head>
<body>
	<h1>게시물 등록결과</h1>
	<c:if test="${rs gt 0}">
		<h2 style="color:red">게시물 등록 성공!</h2>
	</c:if>
		<p><a href="view.jsp">등록한 글 보러가기</a></p>
		<p><a href="list.jsp">글목록 보기</a></p>
</body>
</html> --%>