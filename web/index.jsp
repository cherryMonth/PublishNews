<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: miku
  Date: 7/2/18
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>首页</title>
  </head>
  <s:debug/>
  <body>
  <%
    User user = (User)request.getSession().getAttribute("user");
    out.println(user.getUsername());
    out.println(user.getId());
    out.println(user.getPassword());
  %>
  </body>
</html>
