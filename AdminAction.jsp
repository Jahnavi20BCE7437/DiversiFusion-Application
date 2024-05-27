<%-- 
    Document   : AdminAction
    Created on : 14 Oct, 2023, 11:32:34 AM
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


    ResultSet rs=Queries.getExecuteQuery("select * from admin where username='"+username+"'and password='"+password+"'");
    if(rs.next()){
       
     %>
    <script type='text/javascript'>
        window.alert("Login Successful..!!");
        window.location="AdminHome.jsp";
    </script>
    <%
}else{
%>
    <script type='text/javascript'>
        window.alert("Please Check UerName/Password");
        window.location="Admin.html";
    </script>
    <%
}
}catch(Exception e){
 out.println(e);   
}



%>