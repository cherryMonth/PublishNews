<%@ page import="com.opensymphony.xwork2.util.ValueStack" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="model.Type" %>
<%@ page import="java.util.List" %>
<%@ page import="model.News" %>
<%--
  Created by IntelliJ IDEA.
  User: miku
  Date: 7/5/18
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>创建新闻</title>
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
<s:form action="save_news_action">
    <%
        ValueStack vs = (ValueStack) request.getAttribute("struts.valueStack");  // 获取上一个页面转发的值
        List<Type> type_list = (List<Type>) vs.findValue("type_list");
        News n = (News) vs.findValue("news");
        if (n == null) {
    %>
    <input type="hidden" name="news.id" value="-1"/>
    <input type="hidden" name="news.publisher" value="-1"/>
    <label for="title">标题</label>
    <input type="text" required id="title" name="news.title" placeholder="请输入题目...">
    <br>
    <textarea required style="margin-top:50px;" name="news.content" placeholder="请输入内容..."></textarea>
    <br>
    <%
    } else {
    %>
    <input type="hidden" name="news.id" value="<%=n.getId()%>"/>
    <input type="hidden" name="news.publisher" value="<%=n.getPublisher()%>"/>
    <label for="title">标题</label>
    <input type="text" required id="title" value="<%=n.getTitle()%>" name="news.title" placeholder="请输入题目...">
    <br>
    <textarea required style="margin-top:50px;" name="news.content" placeholder="请输入内容..."><%=n.getContent()%></textarea>
    <br>
    <%
        }

        if (type_list != null){
            %>
    <label for="type">新闻类型</label>
    <select id="type" name="news.type" required>
        <%
        for (int i = 0; i < type_list.size(); i++) {
            String is_select = "";
            if(n!= null && type_list.get(i).getId() == n.getType()) {
                is_select = "selected";
            }
    %>
    <option value="<%=type_list.get(i).getId()%>" <%=is_select%>> <%=type_list.get(i).getType()%></option>
    <%
        }
        }
    %>
    </select>
    <s:submit/>
</s:form>
</body>
</html>
