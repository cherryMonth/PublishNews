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
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="static/css/editormd.css"/>
    <title>创建新闻</title>
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
<s:actionerror/>
<s:actionmessage/>
<script src="static/js/jquery.min.js"></script>
<script src="static/editormd.js"></script>
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
    <input type="text" required id="title" style="width: 30%" name="news.title" placeholder="请输入题目...">
    <%
        if (type_list != null) {
    %>
    <label for="type" style="margin-left: 50px">新闻类型</label>
    <select id="type" name="news.type" required>
        <%
            for (int i = 0; i < type_list.size(); i++) {
                String is_select = "";
                if (n != null && type_list.get(i).getId() == n.getType()) {
                    is_select = "selected";
                }
        %>
        <option value="<%=type_list.get(i).getId()%>" <%=is_select%>><%=type_list.get(i).getType()%>
        </option>
        <%
                }
            }
        %>
    </select>
    <input type="submit" style="margin-left:50%"/>
    <br>
    <div id="layout" style="margin-top: 50px;">
        <div id="editormd">
            <textarea style="display:none;" name="news.content"></textarea>
        </div>
    </div>
    <br>
    <%
    } else {
    %>
    <input type="hidden" name="news.id" value="<%=n.getId()%>"/>
    <input type="hidden" name="news.publisher" value="<%=n.getPublisher()%>"/>
    <label for="title">标题</label>
    <input type="text" required id="title" value="<%=n.getTitle()%>" name="news.title" placeholder="请输入题目...">
    <%
        if (type_list != null) {
    %>
    <label for="type" style="margin-left: 50px">新闻类型</label>
    <select id="type" name="news.type" required>
        <%
            for (int i = 0; i < type_list.size(); i++) {
                String is_select = "";
                if (n != null && type_list.get(i).getId() == n.getType()) {
                    is_select = "selected";
                }
        %>
        <option value="<%=type_list.get(i).getId()%>" <%=is_select%>><%=type_list.get(i).getType()%>
        </option>
        <%
                }
            }
        %>
    </select>
    <input type="submit" style="margin-left:50%"/>
    <div style="margin-top: 50px;">
        <div id="editormd">
            <textarea style="display:none;" name="news.content"><%=n.getContent()%></textarea>
        </div>
    </div>
    <br>
    <%
        }
    %>
</s:form>
<script type="text/javascript">
    var testEditor;

    $(function () {

        editormd.emoji = {
            path: "http://www.emoji-cheat-sheet.com/graphics/emojis/",
            ext: ".png"
        };

        // Twitter Emoji (Twemoji)  graphics files url path
        editormd.twemoji = {
            path: "http://twemoji.maxcdn.com/72x72/",
            ext: ".png"
        };

        testEditor = editormd("editormd", {

            width: "70%",
            height: 450,

            toc: true,

            emoji: true,       // Support Github emoji, Twitter Emoji(Twemoji), fontAwesome, Editor.md logo emojis.

            taskList: true,
            saveHTMLToTextarea: true,
            path: 'static/lib/',
            onload: function () {
            }
        });
    });
</script>
</body>
</html>
