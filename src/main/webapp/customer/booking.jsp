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
            <div class="bg-white rounded-1 p-3">

                  <h6 class="my-1 l-hght-18 font-weight-bold">Hulhumale' Phase 2 Parking Complex</h6>

            </div>
          </div>
        </div>
    <form action="createbooking" method="POST">
      <div class="row">

        <div class="p-3 shadow-sm bg-body px-3 pb-3 mb-3">
          <div class="bg-white rounded-1 p-3">

                <input type="hidden" id="fromDate" name="fromDate" value="<c:out value="${fromdate}"/>">
                <input type="hidden" id="toDate" name="toDate" value="<c:out value="${todate}"/>">

                <!-- Select Seats -->



                <div class="row">
                    <div class="d-flex shadow-sm mb-2 p-2">
                        <div class="sold text-center">
                            <span class="badge bg-light text-dark">Available</span>

                        </div>
                        <div class="sold text-center mx-3">
                            <span class="badge bg-success">Selected</span>

                        </div>
                        <div class="sold text-center">
                            <span class="badge bg-danger">Booked</span>

                        </div>
                    </div>

                  <div class="d-flex text-center  flex-wrap flex-row bd-highlight mb-3">
                      <c:choose>
                          <c:when test="${not empty parkingspots}" >
                            <c:forEach items="${parkingspots}" var="j">

                                <c:set var = "vehicle_exits" value = "${j.vehicle_id}" />


                                <c:choose>
                                <c:when test="${vehicle_exits == 0}">
                                    <div class="p-2 bd-highlight">
                                        <label><input type="checkbox" name="parkingspot" value="<c:out value="${j.id}"/>" class="cust-checkbox" ><span><c:out value="${j.number}"/> </span></label>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="p-2 bd-highlight">
                                        <label class="reserved"><input name="parkingspot" value="<c:out value="${j.id}"/>" type="checkbox" class="cust-checkbox" ><span><c:out value="${j.number}"/> </span></label>
                                    </div>
                                </c:otherwise>
                                </c:choose>




                            </c:forEach>
                          </c:when>

                        </c:choose>

                  </div>

                </div>






          </div>
        </div>
      </div>

    <div class="row">

        <div class="p-3 shadow-sm bg-body px-3 pb-3 mb-3">
            <div class="bg-white rounded-1 p-3">

                <h6 class="my-1 l-hght-18 font-weight-bold">//Payment functionalities will go here</h6>
                <button type="submit" class="mt-2 btn btn-danger btn-block osahanbus-btn rounded-1">Create Booking</button>


            </div>
        </div>
    </div>
    </form>
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




<script type="text/javascript">
  $(document).ready(function(){
    $(".reserved input").prop('checked', true);
    $(".reserved input").prop('disabled', true);
    $("label").click(function(){
      if(!$(this).hasClass("reserved")){
        if($(this).find("input").is(":checked")){
          $(this).addClass("selected");

        }else{
          console.log("selected");
          $(this).removeClass("selected");
        }
      }
      else{
        alert("Already booked");
      }
    })
  });


</script>
<script type="text/javascript">
    $('.check input:checkbox').click(function() {
        $('.check input:checkbox').not(this).prop('checked', false);
    });

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>