<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
</head>
<body>  <!-- 尝试用struts2的标签代替HtML中的元素 -->

<s:actionerror />
<s:i18n name="messageResource_zh_CN">
    <s:form action="/login">
        <s:textfield name="username" key="user"/>
        <s:password name="password" key="pass" />
        <s:submit name="submit" key="submit" />
    </s:form>
</s:i18n>
<a href="register.jsp">注册用户</a>
</body>
</html>
