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
  <script type = "text/javascript"
          src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">
  </script>
  <style>
    html,
    body {
      height: 100%;

    }
    body {
      display: flex;
      background-color: #ededed;
    }

    label{display: block;}
    .cust-checkbox {
      display: none;
    }
    .cust-checkbox + span{

      /*background: #999;*/
      height: 50px;
      width: 70px;
      display:block;
      padding:2px;
      background-color: #ededed;
      border-radius: 3px;
    }
    .reserved .cust-checkbox + span{
      background-color: #dc3545;
    }
    .selected .cust-checkbox + span{
      background-color: #198754;
    }
    .cust-checkbox:checked + span{

        height: 50px;
        width: 70px;
      display:block;
      padding: 3px;
    }
    .cust-checkbox:disabled + span{
      /*background: red;*/
        height: 50px;
        width: 70px;
      display:block;
      padding: 0 0 0 0px;
    }
    .seats{border: 1px solid #ccc;
      padding: 0 15px;max-width: 550px;
      margin: 50px auto 0}
    .info{     padding: 0 15px;
      max-width: 530px;
      margin: 50px auto 0
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




  <!-- main  content goes here -->
        <div class="row">

          <div class="p-3 shadow-sm bg-body px-3 pb-3 mb-3">

            <div class="d-flex justify-content-center">
              <span class="badge rounded-pill bg-success">Active Tickets shown here</span>
            </div>

              <div class="p-3 mb-3 w-100">
                <c:choose>
                  <c:when test="${not empty myTickets}" >
                      <c:forEach items="${myTickets}" var="j">
                            <div class="list_item d-flex col-12 m-0 p-3 bg-light shadow-sm rounded-1 shadow-sm mb-2">
                              <div class="d-flex mb-auto">
                                <img src=../img/qrcode/<c:out value="${j.qrCodeFileName}"/> class="img-fluid">
                              </div>
                              <div class="d-flex w-100">
                                <div class="bus_details w-100 pl-3">
                                  <p class="mb-2 l-hght-18 font-weight-bold">Hulhumale' Phase 2 Parking Complex</p>
                                  <div class="l-hght-10 d-flex align-items-center my-2">
                                    <small class="text-muted mb-0 pr-1">Booking Reference:</small>
                                    <p class="small mb-0 ml-auto l-hght-14"><c:out value="${j.id}"/></p>
                                  </div>
                                  <div class="l-hght-10 d-flex align-items-center my-2">
                                    <small class="text-muted mb-0 pr-1">Start Date: </small>
                                    <p class="small mb-0 ml-auto l-hght-14"><c:out value="${j.from}"/></p>
                                  </div>
                                  <div class="l-hght-10 d-flex align-items-center my-2">
                                    <small class="text-muted mb-0 pr-1">End Date: </small>
                                    <p class="small mb-0 ml-auto l-hght-14"><c:out value="${j.to}"/></p>
                                  </div>
                                  <div class="l-hght-10 d-flex align-items-center mt-3">
                                    <p class="mb-0 pr-1 font-weight-bold">Amount Paid</p>
                                    <p class="mb-0 ml-auto l-hght-14 text-danger font-weight-bold">$700</p>
                                  </div>
                                </div>
                              </div>
                            </div>
                      </c:forEach>
                  </c:when>
                  <c:when test="${empty mybookings}" >
                    <div class="alert alert-warning d-flex align-items-center" role="alert">
                      <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Warning:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                      <div>
                        No tickets to show!
                      </div>
                    </div>
                  </c:when>
                </c:choose>
              </div>


          </div>
        </div>


  <!-- main header content goes here -->




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