<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.opensymphony.xwork2.util.ValueStack" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Type" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="dao.Result" %><%--
  Created by IntelliJ IDEA.
  User: miku
  Date: 7/5/18
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改编辑类型</title>
</head>
<body>
<s:actionerror/>
<s:actionmessage/>
<a href="/showNewsType.action">显示新闻分类</a>
<a href="/show_editor_type.action">修改编辑者类型</a>
<a href="/create_news_action">创建新闻</a>
<a href="#">删除新闻</a>
<a href="#">编辑新闻</a>
<a href="#">修改用户信息</a>

<table>
    <tr>
        <th>编辑者ID</th>
        <th>编辑者名字</th>
        <th>编辑者性别</th>
        <th>当前可编辑类型</th>
        <th>编辑新闻类型</th>
    </tr>
    <%
        ValueStack vs = (ValueStack) request.getAttribute("struts.valueStack");  // 获取上一个页面转发的值
        Result user_result = (Result) vs.findValue("user_list");
        Iterator user_list = null;
        if(user_result != null){
            user_list = user_result.all();
        }
        List<List<String>> editor_type = (List<List<String>>) vs.findValue("editor_type");
        Result type_list = (Result) vs.findValue("type_list");
        if (user_list == null)
            return;
        int index = 0;
        while (user_list.hasNext()) {
            User u = (User) user_list.next();
    %>
    <tr>
        </td>
        <td><input readonly id="<%=u.getId()%>" value="<%=u.getId()%>"/></td>
        <td><input readonly id="<%=u.getUsername()%>" value="<%=u.getUsername()%>"/></td>
        <td><input readonly id="<%=u.getSex()%>" value="<%=u.getSex()%>"/></td>
        <td><select><%
            if (editor_type == null || editor_type.get(index) == null)
                return;
            for (int i = 0; i < editor_type.get(index).size(); i++) {
        %>
            <option value="<%=editor_type.get(index).get(i)%>"><%=editor_type.get(index).get(i)%>
            </option>
            <%
                }
            %></select></td>
        <td><%
        if(type_list == null)
            return;
        Iterator temp = type_list.all();
        while(temp.hasNext()){
            Type type = (Type) temp.next();
            %>
            <input type="checkbox" name="type_list<%=u.getId()%>" value="<%=type.getType()%>"><%=type.getType()%>
            <%
        }
        %></td>
        <td><input type="button" onclick="submit(<%=u.getId()%>)" value="提交"></td>
    </tr>
    <%
            index ++;
        }
    %>
</table>

<script>
    function submit(id) {
        var node = document.getElementsByName("type_list"+id);
        var url = "/edit_editor_type_action.action?";
        if (node != null) {
            for (var i in node) {
                if (node[i].checked) {
                    url = url + "&typelist=" + node[i].value;
                }
            }
            url += "&user_id=" + id;
            ajaxPost(url, window.location, console.log, console.log);
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
                    if (result['status'] === 200) {
                        fnSucceed.href = result['url'];
                    }
                    else {
                        alert(result['info']);
                        fnSucceed.href = result['url'];
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
