<%-- 
    Document   : UpdateAction
    Created on : May 21, 2020, 1:04:43 PM
    Author     : KishanVenky
--%>


<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String id=request.getParameter("id");

try{
    String query="delete from madicine where id='"+id+"'";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
     %>
     <script type="text/javascript">
         window.alert("Successfully Deleted...!!!");
         window.location="ViewMedicine.jsp";
     </script>
     <%
    }else{
 %>
     <script type="text/javascript">
         window.alert("Failed To Delete...!!!");
         window.location="ViewMedicine.jsp";
     </script>
     <%
}
    
    
    
}catch(Exception e){
    out.println(e);
}



%>