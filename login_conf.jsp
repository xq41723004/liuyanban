<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/css.css"/>
        <title> 留言管理――登陆</title>
    </head>
    <body>
    <center>
        <h1>留言管理</h1>
        <hr>
        <br>
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
            boolean flag = false;

          
            String id = request.getParameter("id");   				
            String password = request.getParameter("password");    
            String leixing = request.getParameter("leixing");		/
        %>
        <%--如果用户类型是学生 --%>
        <%
            if (leixing.equals("xuesheng")) {
        %>

        <%
            String sql = "SELECT name FROM person WHERE id=? and password=?";
            try {
                Class.forName(DBDRIVER);
                conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                pstmt.setString(2, password);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    flag = true;
                    session.setAttribute("uname", rs.getString(1));  
                    session.setAttribute("uleixing", "同学");  
                } else {
                    request.setAttribute("err", "错误的学生用户名及密码！！！");
                }
                rs.close();
                pstmt.close();
                conn.close();
            } catch (Exception e) {
            }
        %>
        <%--如果是管理员登录 --%>
        <%
        } else {

        %>
        <%            String sql = "SELECT name FROM guanliyuan WHERE id=? and password=?";
            try {
                Class.forName(DBDRIVER);
                conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                pstmt.setString(2, password);
                rs = pstmt.executeQuery();
                if (rs.next()) {

                    flag = true;
                    session.setAttribute("uname", rs.getString(1));  
                    session.setAttribute("uleixing", "管理员"); 
                } else {
                   
                    request.setAttribute("err", "错误的管理员用户名及密码！！！");
                }
                rs.close();
                pstmt.close();
                conn.close();
            } catch (Exception e) {
            }
        %>

        <%
            }
        %>
        <%
            if (flag) {
        %>
        <jsp:forward page="login_success.jsp"/>
        <%
        } else {
        %>
        <jsp:forward page="login.jsp"/>
        <%
            }
        %>
    </center>
</body>
</html>