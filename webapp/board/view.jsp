<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 줄바꿈 관련 설정 -->
<!-- 줄바꿈을 인식해야하므로 첫번째 set은 엔터를 입력해야함(겉으로는 이상해 보이더라도 수정하지 말것 -->
<c:set var="cr" value="
" scope="application"/>
<c:set var="br" value="<br/>" scope="application"/>

<!--  properties에 있는 값 불러오기 -->
<fmt:setBundle basename="hi-choi.jdbc"/>
<fmt:message key="url" var="url"/>
<fmt:message key="drv" var="drv"/>
<fmt:message key="usr" var="usr"/>
<fmt:message key="pwd" var="pwd"/>

<!--  DB 호출 -->
<sql:setDataSource url="${url}" driver="${drv}" user="${usr}" password="${pwd}" var="mariadb"/>

<!-- DB 업데이트 (조회수 반영) -->
<sql:update dataSource="${mariadb}">
	update board set views = views+1 where bdno = ?
	<sql:param value="${param.bdno}"/>
</sql:update>

<!--  DB 조회 -->
<sql:query var="rs" dataSource="${mariadb}">
	select * from board where bdno = ?
	<sql:param value="${param.bdno}"/>
</sql:query>



<!doctype>
<head lang="ko">
    <meta charset="UTF-8">
    <title>세미프로젝트v1-게시판</title>
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <style>
		#view { width:600px; margin: 0 auto; padding-top: 50px;}
		#view div {margin-bottom:20px;}
		#view div:first-child {margin-bottom:25px;}
		#view div label { font-weight: bold; display:inline-block; width:120px; text-align:right;}
		div span {border:1px solid silver; padding: 5px;}
		.contents {display:inline-block; width:450px; height:250px; border:1px solid silver;}
		.dragup {vertical-align:top;}	
    </style>

</head>
<body>
    <div id="wrap">
    <%@ include file="/layout/header.jsp" %>
    <div id="container">
        <h1>게시판 - 본문보기</h1>
		<div id="view">
			<c:forEach var="r" items="${rs.rows}">
			<div>
				<label>제목</label>
				<span>${r.title}</span>
			</div>
			<div>
				<label>작성글 정보</label>
				<span>${r.userid} / ${r.regdate} / ${r.views} / ${r.thumbup}</span>
			</div>
			<div>
				<label class="dragup">본문</label>
				<span class="contents">${fn:replace(r.contents,cr,br)}</span>
			</div>
			</c:forEach>
			<div>
				<label></label>
				<button type="button" id="listbtn">목록으로</button>
			</div>
		</div>
    </div>
	<%@ include file="/layout/footer.jsp" %>
</div>

	<script>
		var listbtn = document.getElementById('listbtn');
		listbtn = addEventListener('click', go2list)
		
		function go2list() {
			location.href='/board/list.jsp';
		}
	</script>
</body>