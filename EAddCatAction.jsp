<%-- 
    Document   : EAddCatAction
    Created on : 27 Oct, 2023, 10:18:52 AM
    Author     : GKV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{

String name=request.getParameter("name");


ResultSet r=Queries.getExecuteQuery("Select count(*) from ecategory where name='"+name+"'");
int c=0;
while(r.next()){
    c=r.getInt(1);
}
if(c==0){

int i=Queries.getExecuteUpdate("insert into ecategory values('"+name+"')");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Category Added Successfull..!!");
       window.location="EAddCategory.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Category Adding Failed..!!");
       window.location="EAddCategory.jsp";
        </script>
    <%
}
}else{
%>
    <script type="text/javascript">
       window.alert("Category Already Exist..!!");
       window.location="EAddCategory.jsp";
        </script>
    <%
}
}catch(Exception e){
  out.println(e);  
}
%>
