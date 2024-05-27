<%-- 
    Document   : BookAppAction
    Created on : 27 Oct, 2023, 11:16:40 AM
    Author     : GKV
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{

             String id=(String)session.getAttribute("id");
         String email=(String)session.getAttribute("email");
        String mobile=(String)session.getAttribute("mobile");
         
         
     
String mid=request.getParameter("mid");
String category=request.getParameter("category");
String name=request.getParameter("name");
String price=request.getParameter("price");
String noof=request.getParameter("noof");




int i=Queries.getExecuteUpdate("insert into bookappliance values(null,'"+id+"','"+mid+"','"+category+"','"+name+"','"+price+"','"+noof+"',now(),'waiting')");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Booking Successfull..!!");
       window.location="SearchAppliances.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Booking Failed Failed..!!");
       window.location="SearchAppliances.jsp";
        </script>
    <%
}

}catch(Exception e){
  out.println(e);  
}
%>
