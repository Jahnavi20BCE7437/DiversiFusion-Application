<%-- 
    Document   : AddCatItemAction
    Created on : 14 Oct, 2023, 6:45:37 PM
    Author     : GKV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{

String category=request.getParameter("category");
String bname=request.getParameter("bname");
String units=request.getParameter("units");
String price=request.getParameter("price");
String desc=request.getParameter("desc");


ResultSet r=Queries.getExecuteQuery("Select count(*) from material where category='"+category+"' and brand='"+bname+"' and units='"+units+"'");
int c=0;
while(r.next()){
    c=r.getInt(1);
}
if(c==0){

int i=Queries.getExecuteUpdate("insert into material values(null,'"+category+"','"+bname+"','"+units+"','"+price+"','"+desc+"')");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Material Added Successfull..!!");
       window.location="AddMaterial.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Material Added Failed..!!");
       window.location="AddMaterial.jsp";
        </script>
    <%
}
}else{
%>
    <script type="text/javascript">
       window.alert("Meterial Added Already Exist..!!");
       window.location="AddMaterial.jsp";
        </script>
    <%
}
}catch(Exception e){
  out.println(e);  
}
%>
