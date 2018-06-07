<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/css.css"/>
        <title>留言管理――登陆</title>
    </head>
    <body>
    <center>
        <h1>留言管理</h1>
        <hr>
        <br>
        <%
            request.setCharacterEncoding("UTF-8");
        %>

        <%!
            String DBDRIVER = "com.mysql.jdbc.Driver";
            String DBURL = "jdbc:mysql://localhost:3306/db_jsp?characterEncoding=utf-8";
            String DBUSER = "root";
            String DBPASSWORD = "ROOT";
            Connection conn = null;
            Statement stmt = null;
        %>
        <%
            boolean flag = false;

            String leixing = request.getParameter("leixing");
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String psw = request.getParameter("psw");
        %>
        <%
            if (leixing.equals("xuesheng")) {
        %>
        <%
            String sql = "INSERT INTO person(id,name,password)"
                    + " VALUES ('" + id + "','"
                    + name + "','"
                    + psw + "')";
            try {
                Class.forName(DBDRIVER);
                conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                stmt = (Statement) conn.createStatement();
                stmt.executeUpdate(sql);
                stmt.close();
                conn.close();
                flag = true;

            } catch (Exception e) {
                System.out.println("数据库连接失败：" + e.getMessage());
            }
        %>
        <%
        } else {
        %>
        <%
            String sql = "INSERT INTO guanliyuan(id,name,password)"
                    + " VALUES ('" + id + "','"
                    + name + "','"
                    + psw + "')";
            try {
                Class.forName(DBDRIVER);
                conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                stmt = (Statement) conn.createStatement();
                stmt.executeUpdate(sql);
                stmt.close();
                conn.close();
                flag = true;

            } catch (Exception e) {
                System.out.println("数据库连接失败：" + e.getMessage());
            }
        %>
        <%
            }
        %>

        <%
            response.setHeader("refresh", "2;URL=login.jsp");
            if (flag) {
        %>
        会员注册成功，两秒后跳转到登陆首页！！！<br>
        如果没有跳转，请按<a href="login.jsp">这里</a>！！！
        <hr>
        <%
        } else {
        %>
        会员注册失败，两秒后跳转到登陆首页！！！<br>
        如果没有跳转，请按<a href="zhuce.jsp">这里</a>！！！
        <hr>
        <%
            }
        %>

    </center>
</body>
</html>