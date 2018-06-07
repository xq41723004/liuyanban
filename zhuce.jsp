<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/css.css"/>
        <title> 留言管理程序――登陆</title>

    </head>
    <body>
    <center>
        <h1>留言管理</h1>
        <hr>
        <br>
        <%
            request.setCharacterEncoding("UTF-8");
        %>
        <%--注册信息写入数据库 --%>


        <form action="zhuceinsert_do.jsp" method="post">
            <table>
                <tr>
                    <td colspan="2">注册信息：</td>
                </tr>
                <%--用户类型判断 --%>
                <tr>
                    <td>用户类型：</td>
                    <td><select name="leixing">
                            <option  value="xuesheng" >学生</option>
                            <option value="guanliyuan" >管理员</option>
                        </select></td>
                    <td style="color:#F00;">学生普通操作，管理员进行编辑和删除</td>
                </tr>
                <%--用户类型判断 --%>
                <tr>
                    <td>用户ID：</td>
                    <td><input type="text" name="id"></td>
                    <td  style="color:#F00;">必须为数字</td>
                </tr>
                <tr>
                    <td>真实姓名：</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><input type="text" name="psw"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="注册">
                        <input type="reset" value="重置">
                    </td>
                </tr>
            </table>
        </form>
        <h3><a href="login.jsp">回到登陆首页</a></h3>

        <hr>
    </center>
</body>
</html>