<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.opensymphony.xwork2.util.ValueStack" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.News" %>
<%@ page import="model.Type" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示新闻</title>
</head>
<body>
<a href="/showNewsType.action">显示新闻分类</a>
<a href="/show_editor_type.action">修改编辑者类型</a>
<a href="/create_news_action">创建新闻</a>
<a href="/show_news_list">查看新闻</a>
<a href="#">修改用户信息</a>
<s:debug/>
<table>
    <tr>
        <th>主题</th>
        <th>发布者ID</th>
        <th>发布类型ID</th>
        <th>发布时间</th>
        <th>浏览量</th>
        <th>编辑</th>
        <th>删除</th>
    </tr>
<%
    ValueStack vs = (ValueStack) request.getAttribute("struts.valueStack");
    Iterator e = (Iterator) vs.findValue("news_list");
    if (e != null) {
        while (e.hasNext()) {
            News news = (News) e.next();
%>
    <tr>
        <td><li><a href="/show"><%=news.getTitle()%></a></td>
        <td><%=news.getPublisher()%></td>
        <td><%=news.getType()%></td>
        <td><%=news.getDatetime()%></td>
        <td><%=news.getViews()%></td>
        <td>编辑</td>
        <td>delete</td>
    </tr>
        <%
        }
    }

%>
        <%
            Iterator  type_list = (Iterator)vs.findValue("type_list");
            if (type_list ==null) {
                return;
            }
        else{
                int number = (int) vs.findValue("number");
        %>
        <label for="type">新闻类型</label>
        <input type="hidden" name="page" value="<%=number%>"/>
        <select id="type">
            <%
            while (type_list.hasNext()){
                Type type = (Type)type_list.next();
        %>
            <option value="<%=type.getId()%>"><%=type.getType()%>
            </option>
            <%
                    }
                } %></select>
    <script>
    </script>
</table>
</body>
</html>
