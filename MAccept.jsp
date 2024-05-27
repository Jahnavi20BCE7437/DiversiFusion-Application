<%-- 
    Document   : MAccept
    Created on : 15 Oct, 2023, 7:38:26 PM
    Author     : GKV
--%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String id=request.getParameter("id");

try{
    String query="update bookmedicine set status='Accepted' where id='"+id+"'";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
     %>
     <script type="text/javascript">
         window.alert("Successfully Accepted...!!!");
         window.location="ViewMedicineOrders.jsp";
     </script>
     <%
    }else{
 %>
     <script type="text/javascript">
         window.alert("Failed To Accept...!!!");
         window.location="ViewMedicineOrders.jsp";
     </script>
     <%
}
    
    
    
}catch(Exception e){
    out.println(e);
}



%>