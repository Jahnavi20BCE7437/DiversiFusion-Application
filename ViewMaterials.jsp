<%-- 
    Document   : AddMaterial
    Created on : 14 Oct, 2023, 6:31:17 PM
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
                    <a class="nav-link" href="AddContruction.jsp">Home <span class="sr-only">(current)</span></a>
                  </li>
                   <li class="nav-item active">
                    <a class="nav-link" href="AddCategory.jsp">Add Category</a>
                  </li>
                   <li class="nav-item active">
                    <a class="nav-link" href="AddMaterial.jsp">Add Material</a>
                  </li>
                   <li class="nav-item active">
                    <a class="nav-link" href="ViewMaterials.jsp"> View Materials</a>
                  </li>
                   <li class="nav-item active">
                    <a class="nav-link" href="ViewMatAOrders.jsp"> View Orders</a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="Admin.html"> Logout</a>
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
  <section class="contact_section layout_padding-bottom" style="margin-top: 200px;">
    <div class="container">
      <div class="heading_container">
        <h2>
      VIEW MATERIAL 
        </h2>
      </div>
      <div class="row">
        
          
           <table id="example" class="table table-striped table-bordered" style="width:100%">
  <thead>
                  <tr>
                      <th>SR.NO</th>
                       <th>CATEGORY</th>
                        <th>BRAND</th>
                         <th>WEIGHT/NOOF</th>
                         <th>PRICE</th>
                          <th>DESCRIPTION</th>
                          <th>DELETE</th>
                  </tr>
  </thead>
             <%try{
                 ResultSet r=Queries.getExecuteQuery("select * from material");
                 int i=0;
                 while(r.next()){
                     i=i+1;
                     %>
                      <tbody>
                     <tr>
                         <td><%=i%></td>
                         <td> <%=r.getString("category")%></td>
                         <td> <%=r.getString("brand")%></td>
                         <td> <%=r.getString("units")%></td>
                         <td> <%=r.getString("price")%></td>
                         <td> <%=r.getString("description")%></td>
                         <td> <a href="Delete.jsp?id=<%=r.getString("id")%>">Delete</a></td>
                     </tr> 
                     </tbody>
                <% }
                 
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
  <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
   <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap4.min.js"></script>
 
   <script src="js/custom.js"></script>

<script type="text/javascript">
   new DataTable('#example');
      </script>

</body>

</html>