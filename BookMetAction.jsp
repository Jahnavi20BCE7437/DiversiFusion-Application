<%-- 
    Document   : BookMetAction
    Created on : 15 Oct, 2023, 4:28:59 PM
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
String unit=request.getParameter("unit");
String price=request.getParameter("price");
String noof=request.getParameter("noof");




int i=Queries.getExecuteUpdate("insert into bookmet values(null,'"+id+"','"+mid+"','"+category+"','"+name+"','"+unit+"','"+price+"','"+noof+"',now(),'waiting')");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Booking Successfull..!!");
       window.location="SearchMaterials.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Booking Failed Failed..!!");
       window.location="SearchMaterials.jsp";
        </script>
    <%
}

}catch(Exception e){
  out.println(e);  
}
%>
