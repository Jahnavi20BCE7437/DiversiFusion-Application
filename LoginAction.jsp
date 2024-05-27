<%-- 
    Document   : LoginAction
    Created on : 18 Feb, 2023, 11:58:07 AM
    Author     : GKV
--%>
<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

try{

    String username=request.getParameter("username");
    String password=request.getParameter("password");


    ResultSet rs=Queries.getExecuteQuery("select * from register where username='"+username+"'and password='"+password+"'");
    if(rs.next()){
         session.setAttribute("name",rs.getString("name"));
        session.setAttribute("id",rs.getString("id"));
         session.setAttribute("email",rs.getString("email"));
        session.setAttribute("mobile",rs.getString("mobile"));
     %>
    <script type='text/javascript'>
        window.alert("Login Successful..!!");
        window.location="UserHome.jsp";
    </script>
    <%
}else{
%>
    <script type='text/javascript'>
        window.alert("Please Check UerName/Password");
        window.location="Users.html";
    </script>
    <%
}
}catch(Exception e){
 out.println(e);   
}



%>