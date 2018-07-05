<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: miku
  Date: 7/4/18
  Time: 11:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册新用户</title>
</head>
<body>
<s:actionerror />
<s:form action="register">
    <s:textfield name="user.username" key="user"/>
    <s:select list="#{'m':'男','w':'女'}"  name="user.sex" key="sex" />
    <s:select list="#{'editor':'编辑','user':'用户','administrator':'管理员'}"  name="user.user_identity" key="sex" />
    <s:password name="user.password" key="pass" />
    <s:password name="repass" key="repassword" />
    <s:submit/>
</s:form>
</body>
</html>
