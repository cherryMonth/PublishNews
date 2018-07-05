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
<s:debug/>
<a href="/showNewsType.action">显示新闻分类</a>
<a href="/show_editor_type.action">修改编辑者类型</a>
<a href="/create_news_action">创建新闻</a>
<a href="#">删除新闻</a>
<a href="#">编辑新闻</a>
<a href="#">修改用户信息</a>
<body>
<s:form action="save_news_action">
    <label for="title">标题</label>
    <input type="text" required id="title" name="news.title" placeholder="请输入题目...">
    <br>
    <textarea required style="margin-top:50px;" name="news.content" placeholder="请输入内容..."></textarea>
    <br>
    <%
        ValueStack vs = (ValueStack) request.getAttribute("struts.valueStack");  // 获取上一个页面转发的值
        List<Type> type_list = (List<Type>) vs.findValue("type_list");
        News n = (News) vs.findValue("news");
        if (n == null) {
    %>
    <input type="hidden" name="news.id" value="-1"/>
    <input type="hidden" name="news.publisher" value="-1"/>
    <%
    } else {
    %>
    <input type="hidden" name="news.id" value="<%=n.getId()%>"/>
    <input type="hidden" name="news.publisher" value="<%=n.getPublisher()%>"/>
    <%
        }

        if (type_list != null){
            %>
    <label for="type">新闻类型</label>
    <select id="type" name="news.type" required>
        <%
        for (int i = 0; i < type_list.size(); i++) {
    %>
    <option value="<%=type_list.get(i).getId()%>"><%=type_list.get(i).getType()%></option>
    <%
        }
        }
    %>
    </select>
    <s:submit/>
</s:form>
</body>
</html>
