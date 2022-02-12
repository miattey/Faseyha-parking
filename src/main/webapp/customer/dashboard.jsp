<%@ page import="model.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>Rider - Dashboard</title>

  <!-- Bootstrap core CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    html,
    body {
      height: 100%;

    }
    body {
      display: flex;
      background-color: #ededed;
    }






  </style>

</head>
<body>
<main class="container" style="max-width: 1000px;width: 100%;">

  <!-- main header content goes here
      <div class="row">
        <div class="justify-content-center bg-dark d-flex pt-2 align-items-center text-white  shadow-sm">
          <img class="me-3" src="https://play-lh.googleusercontent.com/6bp77Aco1o6H5amfafw6kSQrnyXmZ63MrQtjCIKXukIzzSXctpPVpiweOBzPZRhDizE=s360-rw" alt="" width="" height="60">
        </div>
        -->
        <div class="row bg-dark">
          <div  class="px-3 py-2">
            <nav class="navbar navbar-dark">
                <div class="text-end justify-content-left">
                  <img class="me-3" src="img/logo.png" alt="" width="" height=55">
                </div>
                <div class="d-flex">
                  <div class="flex-shrink-0 dropdown">
                    <a href="#" class="d-block link-light text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
                      <img src="img/user.png" alt="mdo" height="25" class="rounded-circle">
                    </a>
                    <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2" style="">
                      <li class="dropdown-item">@${sessionScope.user.username}</li>
                      <li class="dropdown-item"><hr class="dropdown-divider"></li>
                      <li class="dropdown-item"><a class="dropdown-item" href="logout">Sign out</a></li>
                    </ul>
                  </div>
                </div>

            </nav>
          </div>
        </div>


  <!-- main header content goes here
      <div class="row">
        <div style="background-color:white;" class="px-3 py-2 border-bottom mb-3 ">
          <div class="d-flex justify-content-center">
            <ul class="nav nav-pills nav-fill">
              <li class="nav-item">
                <a href="#" class="nav-item nav-link active">
                  <i class="bi-house-door"></i> Home
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-item nav-link">
                  <i class="bi-envelope"></i> Parking Ticket
                </a>
              </li>


            </ul>
          </div>

        </div>
      </div>
      -->
  <!-- main header content goes here -->


  <!-- main  content goes here -->
        <div class="row">

          <div class="p-3 shadow-sm bg-body px-3 pb-3 mb-3">
            <div class="bg-white rounded-1 p-3">
              <form action="createbooking" method="get">
                <div class="form-group border-bottom pb-2">
                  <label for="exampleFormControlSelect1" class="mb-2"><span class="icofont-search-map text-danger"></span> Parking Area</label><br>
                  <select class="js-example-basic-single form-control select2-hidden-accessible" name="state" data-select2-id="select2-data-1-some" tabindex="-1" aria-hidden="true">
                    <option value="hulhumale" data-select2-id="select2-data-3-ekcu">Hulhumale' Phase 2 Parking Complex</option>
                  </select> </div>
                <div class="form-group border-bottom pb-1">
                  <label for="exampleFormControlSelect1" class="mb-2"><span class="icofont-ui-calendar text-danger"></span> From</label><br>
                  <input name="fromdate" class="form-control border-0 p-0" type="date">
                </div><div class="form-group border-bottom pb-1">
                <label for="exampleFormControlSelect2" class="mb-2"><span class="icofont-ui-calendar text-danger"></span> To</label><br>
                <input name="todate" class="form-control border-0 p-0" type="date">
              </div>

                <button type="submit" class="mt-2 btn btn-danger btn-block osahanbus-btn rounded-1">Check Availability</button>
              </form>
            </div>
          </div>
        </div>
  <!-- main header content goes here -->

        <div class="row">
          <div class=" p-3 bg-body rounded shadow-sm">
            <div class="row m-0">
              <div class="col-6 py-1 pr-1 pl-0">
                <div class="p-3 bg-white shadow-sm rounded-1">
                  <span class="bi-envelope h1"></span>
                  <p class="mb-0 mt-4 font-weight-bold">Safe and Hygenic<br>Vehicles</p>
                </div>
              </div>
              <div class="col-6 py-1 pl-1 pr-0">
                <div class="p-3 bg-white shadow-sm rounded-1">
                  <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-qr-code" viewBox="0 0 16 16">
                    <path d="M2 2h2v2H2V2Z"/>
                    <path d="M6 0v6H0V0h6ZM5 1H1v4h4V1ZM4 12H2v2h2v-2Z"/>
                    <path d="M6 10v6H0v-6h6Zm-5 1v4h4v-4H1Zm11-9h2v2h-2V2Z"/>
                    <path d="M10 0v6h6V0h-6Zm5 1v4h-4V1h4ZM8 1V0h1v2H8v2H7V1h1Zm0 5V4h1v2H8ZM6 8V7h1V6h1v2h1V7h5v1h-4v1H7V8H6Zm0 0v1H2V8H1v1H0V7h3v1h3Zm10 1h-1V7h1v2Zm-1 0h-1v2h2v-1h-1V9Zm-4 0h2v1h-1v1h-1V9Zm2 3v-1h-1v1h-1v1H9v1h3v-2h1Zm0 0h3v1h-2v1h-1v-2Zm-4-1v1h1v-2H7v1h2Z"/>
                    <path d="M7 12h1v3h4v1H7v-4Zm9 2v2h-3v-1h2v-1h1Z"/>
                  </svg>
                  <p class="mb-0 mt-4 font-weight-bold">Best Customer<br>Support</p>
                </div>
              </div>
              <div class="col-6 py-1 pr-1 pl-0">
                <div class="p-3 bg-white shadow-sm rounded-1">
                  <img class="img-fluid" src="img/live-tracking.svg" alt="">
                  <p class="mb-0 mt-4 font-weight-bold">Live Track your<br>Journey</p>
                </div>
              </div>
              <div class="col-6 py-1 pl-1 pr-0">
                <div class="p-3 bg-white shadow-sm rounded-1">
                  <img class="img-fluid" src="img/verified-drivers.svg" alt="">
                  <p class="mb-0 mt-4 font-weight-bold">Verified Drivers<br>and Vehicles</p>
                </div>
              </div>
            </div>
          </div>
        </div>


      <div class="container fixed-bottom p-3" style="max-width: 1000px;">
        <div class="footer-menu row m-0 bg-danger shadow rounded-2 p-1">
          <div class="col-4 p-0 text-center">
            <a href="dashboard" class="home text-white active text-decoration-none">
              <span class="bi-house h5"></span>
              <p class="mb-0 small">Home</p>
            </a>
          </div>
          <div class="col-4 p-0 text-center">
            <a href="mytickets" class="home text-white text-decoration-none">
              <span class="bi-envelope h5"></span>
              <p class="mb-0 small" >My Tickets</p>
            </a>
          </div>
          <div class="col-4 p-0 text-center">
            <a href="#" class="home text-white text-decoration-none">
              <span class="bi-bullseye h5"></span>
              <p class="mb-0 small">Vehicle</p>
            </a>
          </div>

        </div>
      </div>




  <!--Nevigation goes here
  <div style="background-color:;" class="bg-dark  px-3 py-2 border-bottom">
    <nav class="navbar navbar-light">
      <div class="container-fluid">
        <div class="text-end justify-content-left">



        </div>
        <div class="d-flex">
          <div class="flex-shrink-0 dropdown">
            <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
              <img src="img/user.png" alt="mdo"  height="40" class="rounded-circle">
            </a>
            <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2" style="">
              <li class="dropdown-item">@${sessionScope.user.username}</li>
              <li class="dropdown-item"><hr class="dropdown-divider"></li>
              <li class="dropdown-item"><a class="dropdown-item" href="logout">Sign out</a></li>
            </ul>
          </div>
        </div>
      </div>
    </nav>
  </div>
  -->









</main>







<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>