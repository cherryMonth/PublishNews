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
<s:actionerror/>
<s:actionmessage/>
<s:if test="#session.user != null">
    <s:if test='#session.user.user_identity.equals("administrator")'>
        <a href="/showNewsType.action">显示新闻分类</a>
        <a href="/show_editor_type.action">修改编辑者类型</a>
        <a href="/create_news_action">创建新闻</a>
        <a href="/show_news_list">查看新闻</a>
        <a href="register.jsp">修改用户信息</a>
        <a href="/show_history.action">查看历史记录</a>
        <a href="/show_collect_news_action">查看收藏新闻</a>
        <a href="/logout.action">注销</a>
    </s:if>
    <s:elseif test='#session.user.user_identity.equals("editor")'>
        <a href="/create_news_action">创建新闻</a>
        <a href="/show_news_list">查看新闻</a>
        <a href="register.jsp">修改用户信息</a>
        <a href="/show_history.action">查看历史记录</a>
        <a href="/show_collect_news_action">查看收藏新闻</a>
        <a href="/logout.action">注销</a>
    </s:elseif>
    <s:elseif test='#session.user.user_identity.equals("user")'>
        <a href="/show_news_list">查看新闻</a>
        <a href="register.jsp">修改用户信息</a>
        <a href="/show_history.action">查看历史记录</a>
        <a href="/show_collect_news_action">查看收藏新闻</a>
        <a href="/logout.action">注销</a>
    </s:elseif>
    <s:else>
    </s:else>
</s:if>
<s:else>
    <a href="/login.jsp">返回登录页面</a>
</s:else>
<s:form action="register">
    <s:textfield name="user.username" key="user" value="%{#session.user.username}"/>
    <s:hidden name="user.id" value="%{#session.user.id}"/>
    <s:select list="#{'m':'男','w':'女'}" name="user.sex" key="sex" listKey="key" listValue="value"
              value="%{#session.user.sex}"/>
    <s:if test="#session.user == null">
        <s:select list="#{'editor':'编辑','user':'用户','administrator':'管理员'}" listKey="key"
                  value="%{#session.user.user_identity}" listValue="value" name="user.user_identity"
                  key="user_identity"/>
    </s:if>
    <s:else>
        <s:textfield key="user_identity" value="%{#session.user.user_identity}" readonly="true"/>
    </s:else>
    <s:password name="user.password" key="pass"/>
    <s:password name="repass" key="repassword"/>
    <s:submit/>
</s:form>
</body>
</html>
