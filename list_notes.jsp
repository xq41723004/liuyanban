<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<%!
    String str;

    public String subStr(String str) {
        if (str == null || "".equals(str)) {
            return "";
        }
        if (str.length() > 10) //            return str.substring(0,10) + "...";
        {
            return str;
        } else {
            return str;
        }
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/css.css"/>
        <title> 留言管理――登陆</title>
        <script type="text/javascript">
            function Msg(canshu) {
                alert(canshu);
            }

        </script>

    </head>
    <body  background="images/back.png">
    <center>
        <h1>留言管理</h1>
        <hr>
        <br>
        <%
            request.setCharacterEncoding("UTF-8");
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
            int i = 0;
            String sql = null;
            String keyword = request.getParameter("keyword");
            // out.println(keyword) ;
            if (keyword == null) {
                sql = "SELECT id,title,author,content FROM note";
            } else {
                sql = "SELECT id,title,author,content FROM note WHERE title like ? or author like ? or content like ?";
            }

            try {
                Class.forName(DBDRIVER);
                conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                pstmt = conn.prepareStatement(sql);
                if (keyword != null) {
                    pstmt.setString(1, "%" + keyword + "%");
                    pstmt.setString(2, "%" + keyword + "%");
                    pstmt.setString(3, "%" + keyword + "%");
                }

                rs = pstmt.executeQuery();
        %>
        <form action="list_notes.jsp" method="POST">
            请输入查询内容：<input type="text" name="keyword">
            <input type="submit" value="查询">
        </form>
    </h3><a href="insert.jsp">添加新留言</a>　　　　　　　　<a href="go.jsp">退出留言操作</a></h3>
    <%
        if (session.getAttribute("uleixing").equals("同学")) {
    %>
<table width="92%" border="3" >
    <tr>
        <td>留言ID</td>
        <td>标题</td>
        <td>作者</td>
        <td>内容</td>
        <td>删除</td>
        <td>编辑</td>
    </tr>
    <%
        while (rs.next()) {
            i++;
            int id = rs.getInt(1);
            String title = rs.getString(2);
            String author = rs.getString(3);
            String content = rs.getString(4);

            if (keyword != null) {
                title = title.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
                author = author.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
                content = content.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
            }
    %>
    <tr>
        <td><%=id%></td>
        <td><a href="update.jsp?id=<%=id%>"><%=title%></a></td>
        <td><%=author%></td>
        <td style="height:20px;">　<img src="images/list.png" /> <%=subStr(content)%></td>
        <td><a href="#" onclick="Msg('管理员才可以进行删除操作')";>删除</a></td>
        <td><a href="#" onclick="Msg('管理员才可以进行编辑操作')";>编辑</td>
    </tr>

    <%
        }
        if (i == 0) {
    %>
    <tr>
        <td colspan="5">没有任何内容！！！</td>
    </tr>
    <%
        }
    %>
</table>
<%
} else {
%>
<table width="92%" border="3">
    <tr>
        <td>留言ID</td>
        <td>标题</td>
        <td>作者</td>
        <td>内容</td>
        <td>删除</td>
        <td>编辑</td>
    </tr>
    <%
        while (rs.next()) {
            i++;
            int id = rs.getInt(1);
            String title = rs.getString(2);
            String author = rs.getString(3);
            String content = rs.getString(4);

            if (keyword != null) {
                title = title.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
                author = author.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
                content = content.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
            }
    %>
    <tr>
        <td><%=id%></td>
        <td><a href="update.jsp?id=<%=id%>"><%=title%></a></td>
        <td><%=author%></td>
        <td style="height:20px;">　<img src="images/list.png" /> <%=subStr(content)%></td>
        <td><a href="delete_do.jsp?id=<%=id%>">删除</a></td>
        <td><a href="update.jsp?id=<%=id%>">编辑</td>
    </tr>

    <%
        }
        if (i == 0) {
    %>
    <tr>
        <td colspan="5">没有任何内容！！！</td>
    </tr>
    <%
        }
    %>
</table>

<%
    }
%>
<%
        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
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
<hr>
</center>
</body>
</html>