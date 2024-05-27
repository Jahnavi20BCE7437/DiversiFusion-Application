<%-- 
    Document   : MatCancel
    Created on : 15 Oct, 2023, 7:24:56 PM
    Author     : GKV
--%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String id=request.getParameter("id");

try{
    String query="update bookmet set status='Cancelled' where id='"+id+"'";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
     %>
     <script type="text/javascript">
         window.alert("Order Cancelled...!!!");
         window.location="ViewMatOrders.jsp";
     </script>
     <%
    }else{
 %>
     <script type="text/javascript">
         window.alert("Failed To Cancel Order...!!!");
         window.location="ViewMatOrders.jsp";
     </script>
     <%
}
    
    
    
}catch(Exception e){
    out.println(e);
}



%>