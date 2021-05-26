<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype>
<head lang="ko">
    <meta charset="UTF-8">
    <title>세미프로젝트v1-view</title>
    <link rel="stylesheet" type="text/css" href="../css/base.css">
        <style>
        table{
            margin : 100px auto;
            width:500px;

        }
        td{
            border : 1px solid;

        }
    </style>

</head>
<body>
    <div id="wrap">
    <%@ include file="/layout/header.jsp" %>
    <div id="container">
        <h2>게시판 본문글</h2>
        <table>
        <tr>
            <td>제&nbsp;&nbsp;목</td>
            <td>시간은 금이라구~</td>
        </tr>
                <tr>
            <td>작성자</td>
            <td>시간은 금이라구~</td>
        </tr>
                <tr>
            <td>작성일</td>
            <td>시간은 금이라구~</td>
        </tr>
                <tr>
            <td>본문</td>
            <td>시간은 금이라구~</td>
        </tr>
        </table>

    </div>
	<%@ include file="/layout/footer.jsp" %>
</div>
</body>