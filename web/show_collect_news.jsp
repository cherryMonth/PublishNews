<%@ page import="com.opensymphony.xwork2.util.ValueStack" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Collect" %><%--
  Created by IntelliJ IDEA.
  User: miku
  Date: 7/8/18
  Time: 7:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>显示收藏新闻</title>
</head>
<body>
<s:actionerror/>
<s:actionmessage/>
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
<table>
    <tr>
        <th>文章ID</th>
        <th>收藏时间</th>
        <th>查看文章</th>
        <th>取消收藏</th>
    </tr>
        <%
        ValueStack vs = (ValueStack) request.getAttribute("struts.valueStack");  // 获取上一个页面转发的值
        List<Object> collect_list = (List<Object>) vs.findValue("collect_list");
        if(collect_list != null) {
            for(Object o :collect_list){
                Collect c = (Collect)o;
            %>
    <tr>
        <td><%=c.getNews_id()%></td>
        <td><%=c.getDatetime()%></td>
        <td><li><a target="_blank" href="/show_single_news?news.id=<%=c.getNews_id()%>">点击查看</a></li></td>
        <td><li><a href="/delete_collect_news_action?id=<%=c.getNews_id()%>&title=<%=c.getNews_id()%>">取消收藏</a></li></td>
    </tr>
    <%
            }
        }
        %>
</table>
</body>
</html>