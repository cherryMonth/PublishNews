<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.opensymphony.xwork2.util.ValueStack" %>
<%@ page import="model.News" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Comment" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: miku
  Date: 7/5/18
  Time: 8:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
<%

    ValueStack vs = (ValueStack) request.getAttribute("struts.valueStack");  // 获取上一个页面转发的值
    News news = (News) vs.findValue("news");
    List<Object> comment_list = (List<Object>) vs.findValue("comment_list");
    User user = (User) ActionContext.getContext().getSession().get("user");
%>
<br>
<label value="题目" for="title">
    <input type="text" id="title" value="<%=news.getTitle()%>" readonly/>
</label>
<label for="content" value="内容">
    <textarea id="content" readonly><%=news.getContent()%></textarea>
</label>
<label value="日期" for="date">
    <input type="text" id="date" value="<%=news.getDatetime()%>" readonly/>
</label>
<br>
<button class="btn btn-default" style="margin-top: 50px;float:right;margin-right: 3%;margin-bottom: 5%;float:left"
        onclick="addcomment()">添加评论
</button>
<button id="remove" class="btn btn-default" style="display: none" onclick="removecomment()">取消</button>
<div id="addcomment" style="margin-top:20px;">
    <hr style="width: 100%;">
    <form id="form" action="addComment">
        <input type="hidden" name="comment.commentator" value="<%=user.getId()%>"/>
        <input type="hidden" name="comment.news" value="<%=news.getId()%>"/>
        <div class="form-group">
            <textarea name="comment.info" class="textarea" style="width:400px;height:60px;float:left"
                      placeholder="最多只能输入150字哦..." required=""></textarea>
        </div>
        <div class="form-group">
            <button type="submit" class="btn-default btn" style="float:right">提交</button>
        </div>
    </form>
</div>
<br>
<table style="margin-top: 50px;">
    <tr>
        <th>评论者ID</th>
        <th>评论内容</th>
        <th>评论时间</th>
        <th>操作</th>
    </tr>
    <%
        if (comment_list != null && user != null) {
            for (Object o : comment_list) {
                Comment c = (Comment) o;
    %>
    <tr>
        <td><%=c.getCommentator()%>
        </td>
        <td><%=c.getInfo()%>
        </td>
        <td><%=c.getDatetime()%>
        </td>
        <%
            if (user.getId() == c.getCommentator()) {
        %>
        <td>
            <li><a href="/deleteComment?news.id=<%=news.getId()%>&commentator=<%=user.getId()%>">删除</a></li>
        </td>
        <%} %>
    </tr>
    <%
            }
        }
    %>
</table>
<script>
    removecomment();
    function addcomment() {
        var handler = document.getElementById("addcomment");
        handler.setAttribute("style", "margin-top:20px;");
        var btn = document.getElementById("remove");
        btn.setAttribute("style", "float:right;margin-right: 3%;margin-bottom: 5%;float:right");
    }

    function removecomment() {
        var handler = document.getElementById("addcomment");
        handler.setAttribute("style", "display:none");
        var btn = document.getElementById("remove");
        btn.setAttribute("style", "display: none");
    }
</script>
</body>
</html>
