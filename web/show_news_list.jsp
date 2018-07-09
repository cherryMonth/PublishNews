<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.opensymphony.xwork2.util.ValueStack" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.News" %>
<%@ page import="model.Type" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示新闻</title>
</head>
<body>
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
<br>
<s:actionerror/>
<s:actionmessage/>
<s:form action="search">
    <s:label value="请输入查询条件" for="sql"/>
        <s:textfield name="sql" required="true"/>
    <s:submit/>
</s:form>
<table>
    <tr>
        <th>主题</th>
        <th>发布者ID</th>
        <th>发布类型ID</th>
        <th>发布时间</th>
        <th>浏览量</th>
        <th>收藏</th>
        <th>编辑</th>
        <th>删除</th>
    </tr>
<%
    ValueStack vs = (ValueStack) request.getAttribute("struts.valueStack");
    List<Object> e = (List<Object>) vs.findValue("news_list");
    List collect_list = (List) vs.findValue("collect_list");
    Type type_value = (Type)vs.findValue("type");
    User user = (User)ActionContext.getContext().getSession().get("user");
    int index = 0;
    if (e != null && user != null) {
        for (Object o:e) {
            News news = (News)o;
%>
    <tr>
        <td><li><a href="/show_single_news?news.id=<%=news.getId()%>"><%=news.getTitle()%></a></li></td>
        <td><%=news.getPublisher()%></td>
        <td><%=news.getType()%></td>
        <td><%=news.getDatetime()%></td>
        <td><%=news.getViews()%></td>
        <% if (!(boolean)collect_list.get(index)) {%>
        <td><li><a href="/collect_news_action?id=<%=news.getId()%>&title=<%=news.getTitle()%>">收藏</a></li></td>
        <%} else {%>
        <td><li><a href="/delete_collect_news_action?id=<%=news.getId()%>&title=<%=news.getTitle()%>">取消收藏</a></li></td>
        <% } %>
        <% if(!("user".equals(user.getUser_identity()))) {%>
        <td><li><a href="/edit_news_action?news.id=<%=news.getId()%>">编辑</a></li></td>
        <td><li><a href="/delete_news_action?news_id=<%=news.getId()%>">delete</a></li></td>
        <% }%>
    </tr>
        <%
                    index ++;
        }
    }

%>
        <%
            Iterator  type_list = (Iterator) vs.findValue("type_list");
            if (type_list ==null) {
                return;
            }
        else{
        %>
        <label for="type">新闻类型</label>
        <select id="type" onchange="on_click()">
            <%
                while (type_list.hasNext()) {
                    Type type = (Type) type_list.next();
                    if(type_value != null && type_value.getId() == type.getId()){
            %>
            <option value="<%=type.getId()%>" selected="selected"><%=type.getType()%></option >
            <% } else {
                %>
            <option value="<%=type.getId()%>"><%=type.getType()%></option >
            <%
                        }
                    }
                } %></select>
    <%
        int total_num = (int)vs.findValue("total_num");
        for(int i = 1; i<= total_num;i++){
            %>
    <a style="margin-left: 50px;" id="<%=i%>"><%=i%><a/>
    <%
        }
    %>
</table>
<script>
    change_href();
    function change_href() {
        for(var i = 1; i <= <%=total_num%>; i++){
            var url = '/show_news_list.action';
            var type = document.getElementById("type").value;
            url += "?type.id=" + type + "&number=" + (i * 10 - 10);
            document.getElementById("" + i).href = url;
        }
    }
    function on_click() {
        var url = '/show_news_list.action';
        var type = document.getElementById("type").value;
        url += "?type.id=" + type + "&number=" + 0;
        window.location.href = url
    }
</script>
</body>
</html>
