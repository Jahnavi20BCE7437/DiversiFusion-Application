<%-- 
    Document   : AddMedicineAction
    Created on : 14 Oct, 2023, 8:40:50 PM
    Author     : GKV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{

String mcat=request.getParameter("mcat");
String bname=request.getParameter("bname");
String price=request.getParameter("price");
String desc=request.getParameter("desc");


ResultSet r=Queries.getExecuteQuery("Select count(*) from medicine where category='"+mcat+"' and medicine='"+bname+"'");
int c=0;
while(r.next()){
    c=r.getInt(1);
}
if(c==0){

int i=Queries.getExecuteUpdate("insert into medicine values(null,'"+mcat+"','"+bname+"','"+price+"','"+desc+"')");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Medicine Added Successfull..!!");
       window.location="AddMedicine1.jsp";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Medicine Added Failed..!!");
       window.location="AddMedicine1.jsp";
        </script>
    <%
}
}else{
%>
    <script type="text/javascript">
       window.alert("Medicine Added Already Exist..!!");
       window.location="AddMedicine1.jsp";
        </script>
    <%
}
}catch(Exception e){
  out.println(e);  
}
%>
