<%-- 
    Document   : BookMaterials
    Created on : 15 Oct, 2023, 4:23:28 PM
    Author     : GKV
--%>
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
                    <a class="nav-link" href="SearchMaterials.jsp">Home <span class="sr-only">(current)</span></a>
                  </li>
                   <li class="nav-item active">
                    <a class="nav-link" href="ViewMatOrders.jsp"> View ORDERS</a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="ViewMatInvoice.jsp"> View Invoice</a>
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
 <% 
             String id=(String)session.getAttribute("id");
         String email=(String)session.getAttribute("email");
        String mobile=(String)session.getAttribute("mobile");
         
         String id1=request.getParameter("id");
         String price=request.getParameter("price");
         String name=request.getParameter("name");
          String category=request.getParameter("cat");
         String unit=request.getParameter("unit");
         %>

  <!-- contact section -->
  <section class="contact_section layout_padding-bottom" style="margin-top: 200px;">
    <div class="container">
      <div class="heading_container">
        <h2>
      BOOK MATERIALS 
        </h2>
      </div>
      <div class="row">
        <div class="col-md-7">
          <div class="form_container">
            <form action="BookMetAction.jsp" method="post">
                  <div>
                Material ID<input type="text" name="mid" value="<%=id1%>" readonly/>
              </div>
               <div>
                Material Category<input type="text" name="category" value="<%=category%>" readonly/>
              </div>
              <div>
                Material Name<input type="text" name="name" value="<%=name%>" readonly/>
              </div>
              <div>
                Unit<input type="text" name="unit" value="<%=unit%>" readonly/>
              </div>
              <div>
                Material Price<input type="text" name="price" value="<%=price%>" readonly/>
              </div>
              <div>
                  No.of Material<input type="text" name="noof" placeholder="Enter No.of Medicines" required=""/>
              </div>
              
              <div class="btn_box">
               <li class="nav-item active">
                   <a class="nav-link" href="pay1.jsp"> CONFORM BOOKING</a>
                  </li>
              </div>
            </form>
          </div>
        </div>
        <div class="col-md-5">
          <div class="img-box">
            <img src="img/Medicine.png" alt="">
          </div>
        </div>
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


</body>

</html>