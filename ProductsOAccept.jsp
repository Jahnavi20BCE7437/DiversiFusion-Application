<%-- 
    Document   : ProductsOAccept
    Created on : 27 Oct, 2023, 11:34:00 AM
    Author     : GKV
--%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String id=request.getParameter("id");

try{
    String query="update bookappliance set status='Accepted' where id='"+id+"'";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
     %>
     <script type="text/javascript">
         window.alert("Successfully Accepted...!!!");
         window.location="EViewMatAOrders.jsp";
     </script>
     <%
    }else{
 %>
     <script type="text/javascript">
         window.alert("Failed To Accept...!!!");
         window.location="EViewMatAOrders.jsp";
     </script>
     <%
}
    
    
    
}catch(Exception e){
    out.println(e);
}



%>
