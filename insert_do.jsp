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
        <%
            if (session.getAttribute("uname") != null) {
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
            String title1 = request.getParameter("title");
            String author1 = request.getParameter("author");
            String content1 = request.getParameter("content");
        %>
        <%
            String sql = "INSERT INTO note(title,author,content)"
                    + " VALUES ('" + title1 + "','"
                    + author1 + "','"
                    + content1 + "')";
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
            response.setHeader("refresh", "2;URL=list_notes.jsp");
            if (flag) {
        %>
        留言添加成功，两秒后跳转到留言列表页！！！<br>
        如果没有跳转，请按<a href="list_notes.jsp">这里</a>！！！
        <hr>
        <%
        } else {
        %>
        留言添加失败，两秒后跳转到留言列表页！！！<br>
        如果没有跳转，请按<a href="list_notes.jsp">这里</a>！！！
        <hr>
        <%
            }
        %>
        <%
        } else {
            response.setHeader("refresh", "2;URL=login.jsp");
        %>
        您还未登陆，请先登陆！！！<br>
        两秒后自动跳转到登陆窗口！！！<br>
        如果没有跳转，请按<a href="login.jsp">这里</a>！！！<br>
        <hr>
        <%
            }
        %>
    </center>
</body>
</html>