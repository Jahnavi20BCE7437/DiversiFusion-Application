<%-- 
    Document   : AddCatAction1
    Created on : 14 Oct, 2023, 8:30:31 PM
    Author     : GKV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{

String name=request.getParameter("name");


ResultSet r=Queries.getExecuteQuery("Select count(*) from mcategory where name='"+name+"'");
int c=0;
while(r.next()){
    c=r.getInt(1);
}
if(c==0){

int i=Queries.getExecuteUpdate("insert into mcategory values('"+name+"')");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Medicine Category Added Successfull..!!");
       window.location="AddMCategory.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Medicine Category Adding Failed..!!");
       window.location="AddMCategory.jsp";
        </script>
    <%
}
}else{
%>
    <script type="text/javascript">
       window.alert("Medicine Category Already Exist..!!");
       window.location="AddMCategory.jsp";
        </script>
    <%
}
}catch(Exception e){
  out.println(e);  
}
%>
