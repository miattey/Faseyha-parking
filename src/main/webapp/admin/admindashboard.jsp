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
  <div class="row">

    <div class="p-3 shadow-sm bg-body px-3 pb-3 mb-2">
      <div class="bg-white rounded-1">

        <h6 class="my-1 l-hght-18 font-weight-bold">Hulhumale' Phase 2 Parking Complex</h6>

      </div>
    </div>
  </div>

  <!-- main  content goes here -->
        <div class="row">

          <div class="p-3 shadow-sm bg-body px-3 pb-3 mb-3">
            <div>
              <c:choose>
                <c:when test="${not empty parkingspot}" >
                  <table class="table table-striped table-bordered" style="width:100%">
                    <thead>
                    <tr>
                      <th>#</th>
                      <th>PARKING SPOT NUMBER</th>
                      <th>STATUS</th>
                      <th>VEHICLE REGISTRATION</th>
                      <th>TYPE</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${parkingspot}" var="j">
                      <tr>

                        <c:set var = "vehicle_registration" value = "${j.getVehicle().getVehicle_registration()}" />
                        <c:set var = "type" value = "${j.getVehicle().getVehicle_type()}" />

                        <td><c:out value="${j.id}"/></td>
                        <td><c:out value="${j.number}"/></td>
                        <td>
                            <c:choose>
                              <c:when test="${vehicle_registration == null}">
                                <span class="badge bg-success">Empty</span>
                              </c:when>
                              <c:otherwise>
                                <span class="badge bg-danger">Parked</span
                              </c:otherwise>
                            </c:choose>
                        </td>
                        <td><c:out value="${vehicle_registration}"/></td>
                        <td><c:out value="${type}"/></td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>

                </c:when>
              </c:choose>

            </div>
          </div>
        </div>
  <!-- main  content goes here -->


  <div class="container fixed-bottom p-3" style="max-width: 1000px;">
    <div class="footer-menu row m-0 bg-danger shadow rounded-2 p-1">
      <div class="col-4 p-0 text-center">
        <a href="admindashboard" class="home text-white active text-decoration-none">
          <span class="bi-house h5"></span>
          <p class="mb-0 small">Home</p>
        </a>
      </div>
      <div class="col-4 p-0 text-center">
        <a href="" class="home text-white text-decoration-none">
          <span class="bi-envelope h5"></span>
          <p class="mb-0 small" >Manage bookings</p>
        </a>
      </div>
      <div class="col-4 p-0 text-center">
        <a href="#" class="home text-white text-decoration-none">
          <span class="bi-bullseye h5"></span>
          <p class="mb-0 small">Another tab</p>
        </a>
      </div>

    </div>
  </div>



</main>







<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>