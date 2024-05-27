<%-- 
    Document   : EViewAppOrders
    Created on : 27 Oct, 2023, 11:18:31 AM
    Author     : GKV
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>  DiversiFusion</title>


  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <!-- nice select -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha256-mLBIhmBvigTFWPSCtvdu6a76T+3Xyt+K571hupeFLg4=" crossorigin="anonymous" />
  <!-- datepicker -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css">
  <!-- Custom styles for this template -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap4.min.css">
  
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
   
</head>

<body class="sub_page">

  <div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
     
      <div class="header_bottom">
        <div class="container-fluid">
          <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="index.html">
              DiversiFusion
            </a>
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class=""> </span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
             <div class="d-flex mr-auto flex-column flex-lg-row align-items-center">
                <ul class="navbar-nav  ">
                  <li class="nav-item ">
                    <a class="nav-link" href="UserHome.jsp">Home <span class="sr-only">(current)</span></a>
                  </li>
                   <li class="nav-item active">
                    <a class="nav-link" href="EViewAppOrders.jsp"> View ORDERS</a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="EViewAppInvoice.jsp"> View Invoice</a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="Users.html"> Logout</a>
                  </li>
                  
               </ul>
              </div>
             
            </div>
          </nav>
        </div>
      </div>
    </header>
    <!-- end header section -->
  </div>


  <!-- contact section -->
  <section class="contact_section layout_padding-bottom" style="margin-top: 250px;">
    <div class="container">
      <div class="heading_container">
        <h2>
      VIEW MY ORDERS 
        </h2>
      </div>
      <div class="row">
        
            <% 
             String id=(String)session.getAttribute("id");
         String email=(String)session.getAttribute("email");
        String mobile=(String)session.getAttribute("mobile");
         
         String name=request.getParameter("name");
         %>
           <table id="example" class="table table-striped table-bordered" style="width:100%">
  <thead>
                  <tr>
                    
                       <th>CATEGORY</th>
                        <th>BRAND</th>
                    
                        <th>PRICE</th>
                  
                        <th>TOTAL</th>
                         <th>BOOKED DATE</th>
                           <th>ORDER STATUS</th>
                       
                         
                          
                  </tr>
  </thead>
             <%try{
                 ResultSet r=Queries.getExecuteQuery("select * from bookappliance where uid='"+id+"'and status!='Cancelled'");
               int st=0;
                 while(r.next()){
                   int price=Integer.parseInt(r.getString("price"));
                    int noof=Integer.parseInt(r.getString("noof"));
                    int tt=price*noof;
                    st=st+tt;
                     String status=r.getString("status");
                     %>
                      <tbody>
                     <tr>
                        
                         <td> <%=r.getString("pcategory")%></td>
                          <td> <%=r.getString("name")%> Rs/-</td>
                       
                         <td> <%=r.getString("price")%> Rs/-</td>
                         <td> <%=r.getString("noof")%></td>
                          <td> <%=tt%> Rs/-</td>
                           <td> <%=r.getString("date")%></td>
                         
                         <%if(status.equals("waiting")){%>
                      <td><a href="ProductCancel.jsp?id=<%=r.getString("id")%>">Cancel Order</a></td>
                            <%}else if(status.equals("Accepted")){%>
                            
                            <td> <%=r.getString("status")%></td>        
                                        <%}%>
                        
                                 </tr> 
                     </tbody>
                <% }%>
                <tbody>
    <tr>
        <td></td>
        <td></td>
        <td></td>
      
        <td>TOTAL</td>
        <td><%=st%> Rs/-</td>
        <td></td>
        
    </tr>
</tbody>
                
                
                <%
                 
             }catch(Exception e){
                 System.out.println(e);
}%>

              </table>   



      </div>  
    </div>
  </section>
  <!-- end contact section -->


  <!-- info section -->
  <section class="info_section ">
    <div class="container">
      <div class="info_top">
        
        <div class="info_form">
         
        </div>
      </div>
    
    </div>
  </section>
  <!-- end info_section -->


  <!-- footer section -->
  <footer class="footer_section">
    <div class="container">
      <p>
        &copy; <span id="displayYear"></span> All Rights Reserved By
        <a href="">DiversiFusion</a>
      </p>
    </div>
  </footer>
  <!-- footer section -->
  

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- nice select -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js" integrity="sha256-Zr3vByTlMGQhvMfgkQ5BtWRSKBGa2QlspKYJnkjZTmo=" crossorigin="anonymous"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <!-- datepicker -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
  <!-- custom js -->
   <script src="js/custom.js"></script>

<script type="text/javascript">
   new DataTable('#example');
      </script>

</body>

</html>