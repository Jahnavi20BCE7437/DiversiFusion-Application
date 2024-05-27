<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="pc.jpg">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="style.css">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Acme&family=Sacramento&family=Sigmar+One&display=swap" rel="stylesheet">
</head>
<body class="background">
  <div class="content">
    <nav class="navbar" class="navbar navbar-light" style="background-color: #ffed99;">
      <div class="white"><h1>DiversiFusion</h1></div>
    </nav>
    <div class="container donate">
      <br>
      <br><br>
      <center>
        <form>
         <form><script src="https://checkout.razorpay.com/v1/payment-button.js" data-payment_button_id="pl_O95fmnhzDQPeRQ" async> </script> </form>
        </form>
      </center>
    </div>
  </div>
  <div class="bottom">
    <center>
      <p class="copy">© <%= new java.util.Date().getYear() + 1900 %> Darisa Jahnavi</p>
    </center>
  </div>
</body>
</html>
