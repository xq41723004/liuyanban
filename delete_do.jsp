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
            if (session.getAttribute("uname") != null) {
        %>	
        <%!
            String DBDRIVER = "com.mysql.jdbc.Driver";
            String DBURL = "jdbc:mysql://localhost:3306/db_jsp?characterEncoding=utf-8";
            String DBUSER = "root";
            String DBPASSWORD = "ROOT";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
        %>
        <%
            int id = 0;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (Exception e) {
            }
        %>
        <%
            String sql = "DELETE FROM note WHERE id=?";
            boolean flag = false;
            try {
                Class.forName(DBDRIVER);
                conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, id);
                pstmt.executeUpdate();
                pstmt.close();
                conn.close();
                flag = true;
            } catch (Exception e) {
            }
        %>
        <%
            response.setHeader("refresh", "2;URL=list_notes.jsp");
            if (flag) {
        %>
        留言删除成功，两秒后跳转到留言列表页！！！<br>
        如果没有跳转，请按<a href="list_notes.jsp">这里</a>！！！
        <%
        } else {
        %>
        留言删除失败，两秒后跳转到留言列表页！！！<br>
        如果没有跳转，请按<a href="list_notes.jsp">这里</a>！！！
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
        <%
            }
        %>
    </center>
</body>
</html>