
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{

String name=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String address=request.getParameter("address");
String username=request.getParameter("username");
String password=request.getParameter("password");

ResultSet r=Queries.getExecuteQuery("Select count(*) from register where email='"+email+"' and mobile='"+email+"'");
int c=0;
while(r.next()){
    c=r.getInt(1);
}
if(c==0){

int i=Queries.getExecuteUpdate("insert into register values(null,'"+name+"','"+email+"','"+mobile+"','"+address+"','"+username+"','"+password+"')");
if(i>0){
    %>
    <script type="text/javascript">
       window.alert("Registration Successfull..!!");
       window.location="Register.html";
        </script>
    <%
}else{
 %>
    <script type="text/javascript">
       window.alert("Registration Failed..!!");
       window.location="Register.html";
        </script>
    <%
}
}else{
%>
    <script type="text/javascript">
       window.alert("Email ID or Mobile Already Exist..!!");
       window.location="Register.jsp";
        </script>
    <%
}
}catch(Exception e){
  out.println(e);  
}
%>
