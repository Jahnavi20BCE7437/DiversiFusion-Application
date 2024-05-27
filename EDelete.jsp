<%-- 
    Document   : EDelete
    Created on : 27 Oct, 2023, 11:03:14 AM
    Author     : GKV
--%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String id=request.getParameter("id");

try{
    String query="delete from electronics where id='"+id+"'";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
     %>
     <script type="text/javascript">
         window.alert("Successfully Deleted...!!!");
         window.location="EViewMaterials.jsp";
     </script>
     <%
    }else{
 %>
     <script type="text/javascript">
         window.alert("Failed To Delete...!!!");
         window.location="EViewMaterials.jsp";
     </script>
     <%
}
    
    
    
}catch(Exception e){
    out.println(e);
}



%>