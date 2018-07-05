<%@ page import="com.opensymphony.xwork2.util.ValueStack" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="model.Type" %>
<%@ page import="java.util.Iterator" %>
<%--
  Created by IntelliJ IDEA.
  User: miku
  Date: 7/4/18
  Time: 2:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示新闻分类</title>
</head>
<body>
<a href="/showNewsType.action">显示新闻分类</a>
<a href="/show_editor_type.action">修改编辑者类型</a>
<a href="/create_news_action">创建新闻</a>
<a href="#">删除新闻</a>
<a href="#">编辑新闻</a>
<a href="#">修改用户信息</a>
<s:actionerror/>
<s:actionmessage/>
<s:form action="/addNewsType.action">
    <s:textfield name="type.type" key="news_type"/>
    <s:submit/>
</s:form>

<table>
    <tr>
        <th>ID</th>
        <th>类型</th>
        <th>修改</th>
        <th>删除</th>
    </tr>
    <%
        ValueStack vs = (ValueStack) request.getAttribute("struts.valueStack");  // 获取上一个页面转发的值
        Iterator iter = (Iterator) vs.findValue("list");
        if (iter == null)
            return;
        while (iter.hasNext()) {
            Type t = (Type) iter.next();
    %>
    <tr>
        <td><%=t.getId()%>
        </td>
        <td><input id="<%=t.getId()%>" value="<%=t.getType()%>"/></td>
        <td><input type="button" onclick="submit(<%=t.getId()%>)" value="提交"></td>
        <td><a href="/del_news_type_action?type.id=<%=t.getId()%>">delete</a></td>
    </tr>
    <%
        }
    %>
</table>
<script>
    function submit(id) {
        var node = document.getElementById(id);
        if (node != null) {
            var id = node.id;
            var type = node.value;
            ajaxPost("/edit_news_type_action.action?type.id=" + id + "&type.type=" + type
                , window.location, console.log, console.log);
        }
    }

    function ajaxPost(url, fnSucceed, fnFail, fnLoading) {
        var ajax = ajaxObject();
        console.log(url);
        ajax.open("post", url, true);
        ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4) {
                if (ajax.status == 200) {
                    var result = JSON.parse(ajax.responseText);
                    if(result['status'] === 200){
                        fnSucceed.href=result['url'];
                    }
                    else{
                        alert(result['info']);
                        fnSucceed.href=result['url'];
                    }
                    //
                }
                else {
                    fnFail("HTTP请求错误！错误码：" + ajax.status);
                }
            }
            else {
                fnLoading();
            }
        };
        ajax.send("");

    }

    function ajaxObject() {
        var xmlHttp;
        try {
            // Firefox, Opera 8.0+, Safari
            xmlHttp = new XMLHttpRequest();
        }
        catch (e) {
            // Internet Explorer
            try {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {
                    alert("您的浏览器不支持AJAX！");
                    return false;
                }
            }
        }
        return xmlHttp;
    }
</script>
</body>
</html>
