<%-- 
    Document   : BookMedAction
    Created on : 14 Oct, 2023, 9:18:54 PM
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
String name=request.getParameter("name");
String price=request.getParameter("price");
String noof=request.getParameter("noof");




int i=Queries.getExecuteUpdate("insert into bookmedicine values(null,'"+id+"','"+mid+"','"+name+"','"+price+"','"+noof+"',now(),'waiting')");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Booking Successfull..!!");
       window.location="SearchMedicine.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Booking Failed Failed..!!");
       window.location="SearchMedicine.jsp";
        </script>
    <%
}

}catch(Exception e){
  out.println(e);  
}
%>
