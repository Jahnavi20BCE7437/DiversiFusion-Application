<%-- 
    Document   : AddEItemAction
    Created on : 27 Oct, 2023, 10:24:51 AM
    Author     : GKV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{

String mcat=request.getParameter("category");
String bname=request.getParameter("brand");
String price=request.getParameter("price");
String desc=request.getParameter("desc");


ResultSet r=Queries.getExecuteQuery("Select count(*) from electronics where category='"+mcat+"' and medicine='"+bname+"'");
int c=0;
while(r.next()){
    c=r.getInt(1);
}
if(c==0){

int i=Queries.getExecuteUpdate("insert into electronics values(null,'"+mcat+"','"+bname+"','"+price+"','"+desc+"')");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Product Added Successfull..!!");
       window.location="EAddMaterial.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Product Adding Failed..!!");
       window.location="EAddMaterial.jsp";
        </script>
    <%
}
}else{
%>
    <script type="text/javascript">
       window.alert("Product Added Already Exist..!!");
       window.location="EAddMaterial.jsp";
        </script>
    <%
}
}catch(Exception e){
  out.println(e);  
}
%>
