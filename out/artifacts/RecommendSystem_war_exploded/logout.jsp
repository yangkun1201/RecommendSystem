<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/5
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>logout</title>
</head>
<body>
    <h1>注销成功</h1>
    <%
        session.setAttribute("username","");
    %>
    <a href="login.jsp">重新登录</a><br>
    <a href="articles-list.jsp">回到主页</a><br>
</body>
</html>
