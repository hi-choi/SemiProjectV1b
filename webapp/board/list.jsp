<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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

<!--  DB에 값 조회 -->
<sql:query var="rs" dataSource="${mariadb}">
	select bdno, title, userid, regdate, views from board order by bdno desc
</sql:query>


<!doctype>
<html>
<head lang="ko">
    <meta charset="UTF-8">
    <title>세미프로젝트v1-list</title>
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <style>
        table{
            margin : 0 auto;
            width:75%;
            border-collapse:collapse;
            table-layout:fixed;


        }
        th, td{
            border : 1px solid black;
            text-align:center;
            padding: 10px;

        }
        td:nth-child(2) {white-space:nowrap; overflow:hidden; text-overflow: ellipsis;}

        .newbtn{
            text-align:right; border:none;
        }
        .tbnav {
            border:none;
        }

        .cpage {
            font-weight:bold; color: red; font-size:30px;
        }

        button {
            width:100px;
            padding:5px;
            margin-right: -10px;
        }
    </style>
</head>
<body>
<div id="wrap">
    <%@ include file="/layout/header.jsp" %>
    <div id="container">
        <h2>게시판</h2>

        <table id="board">
            <colgroup> <!-- 테이블 컬럼 스타일 정의 -->
                <col style="width:10%">
                <col style="">
                <col style="width:15%">
                <col style="width:15%">
                <col style="width:10%">
            </colgroup>
            <thead>
                <tr>
                	<td colspan="5" class="newbtn">
                		<!-- 로그인해야지만 글쓰기 버튼을 볼 수 있게 설정 -->
                		<c:if test="${!empty sessionScope.userid}">
                			<button type="button" id="newbtn" name="newbtn">글쓰기</button>
                		</c:if>
                		<c:if test="${empty sessionScope.userid}">
                			&nbsp;
                		</c:if>
                	</td>
               </tr>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회</th>
                
            </tr></thead>
            <tbody>
            
            	<c:forEach var="r" items="${rs.rows}" varStatus="no">
            		<tr>
            		<!-- DB의 번호가 아닌 새로운 번호를 출력 -->
            		<td>${no.count}</td>
            		<!-- 링크에 글번호를 질의 문자 형태로 보냄(폼 없이 보낼 경우) -->
            		<td><a href="/board/view.jsp?bdno=${r.bdno}">${r.title}</a></td>
            		<td>${r.userid}</td>
            		<td><fmt:formatDate value="${r.regdate}" pattern="yyyy-MM-dd"/></td>
            		<td>${r.views}</td>
            	</c:forEach>
            
            </tbody>

            <tfoot>
                <tr><td colspan="5" class="tbnav"><span>◁ ◀◀<span class="cpage">1&nbsp;</span>2 3 4 5 6 7 8 9 10 ▶▶ ▷</span></td></tr>
            </tfoot>
        </table>
        
        

    </div>
	<%@ include file="/layout/footer.jsp" %>
</div>

	        

	<script>
		var newbtn = document.getElementById('newbtn');
		newbtn.addEventListener('click',go2write);
		
		function go2write() {
			location.href='/board/write.jsp';
		}
	</script>
</body>
</html>