
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{

String name=request.getParameter("name");


ResultSet r=Queries.getExecuteQuery("Select count(*) from category where name='"+name+"'");
int c=0;
while(r.next()){
    c=r.getInt(1);
}
if(c==0){

int i=Queries.getExecuteUpdate("insert into category values('"+name+"')");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Category Added Successfull..!!");
       window.location="AddCategory.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Category Adding Failed..!!");
       window.location="AddCategory.jsp";
        </script>
    <%
}
}else{
%>
    <script type="text/javascript">
       window.alert("Category Already Exist..!!");
       window.location="AddCategory.jsp";
        </script>
    <%
}
}catch(Exception e){
  out.println(e);  
}
%>
