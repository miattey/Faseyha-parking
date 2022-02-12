<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Faseyha Parking</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        html,
        body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #ededed;
            font-weight: 300;
            font-size: 0.9rem;
        }



    </style>

</head>
<body class="bg-light">
<!-- verification -->
<div class="osahan-verification padding-bt">
    <div class="p-3 shadow bg-danger danger-nav osahan-home-header">
        <div class="font-weight-normal mb-0 d-flex align-items-center">
            <img src="img/logo.png" class="img-fluid osahan-nav-logo">
            <div class="ml-auto d-flex align-items-center">
                <a href="profile.html" class="mr-3"><img src="img/user1.jpg" class="img-fluid rounded-circle"></a>
                <a class="toggle osahan-toggle h4 m-0 text-white ml-auto hc-nav-trigger hc-nav-1" href="#" role="button" aria-controls="hc-nav-1"><i class="icofont-navigation-menu"></i></a>
            </div>
        </div>
    </div>
    <div class="bg-danger px-3 pb-3">
        <div class="bg-white rounded-1 p-3">
            <form action="listing.html">
                <div class="form-group border-bottom pb-2">
                    <label for="exampleFormControlSelect1" class="mb-2"><span class="icofont-search-map text-danger"></span> From</label><br>
                    <select class="js-example-basic-single form-control select2-hidden-accessible" name="state" data-select2-id="select2-data-1-some" tabindex="-1" aria-hidden="true">
                        <option value="Amritsar" data-select2-id="select2-data-3-ekcu">Amritsar</option>
                        <option value="Agra">Agra</option>
                        <option value="Ahmedabad">Ahmedabad</option>
                        <option value="Bareilly">Bareilly</option>
                        <option value="Bathinda">Bathinda</option>
                        <option value="Bhiwani">Bhiwani</option>
                        <option value="Chandigarh">Chandigarh</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Fatehabad">Fatehabad</option>
                        <option value="Gurgaon">Gurgaon</option>
                        <option value="Hissar">Hissar</option>
                        <option value="Jajpur">Jajpur</option>
                        <option value="Jodhpur">Jodhpur</option>
                        <option value="Mumbai">Mumbai</option>
                        <option value="Nanded">Nanded</option>
                    </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="select2-data-2-97q4" style="width: 1852px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-state-f9-container" aria-controls="select2-state-f9-container"><span class="select2-selection__rendered" id="select2-state-f9-container" role="textbox" aria-readonly="true" title="Amritsar">Amritsar</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                </div>
                <div class="form-group border-bottom pb-2">
                    <label for="exampleFormControlSelect1" class="mb-2"><span class="icofont-google-map text-danger"></span> To</label><br>
                    <select class="js-example-basic-single form-control select2-hidden-accessible" name="state" data-select2-id="select2-data-4-mam8" tabindex="-1" aria-hidden="true">
                        <option value="Amritsar">Amritsar</option>
                        <option value="Agra">Agra</option>
                        <option value="Ahmedabad">Ahmedabad</option>
                        <option value="Bareilly">Bareilly</option>
                        <option value="Bathinda">Bathinda</option>
                        <option value="Bhiwani">Bhiwani</option>
                        <option value="Chandigarh" selected="" data-select2-id="select2-data-6-tgxm">Chandigarh</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Fatehabad">Fatehabad</option>
                        <option value="Gurgaon">Gurgaon</option>
                        <option value="Hissar">Hissar</option>
                        <option value="Jajpur">Jajpur</option>
                        <option value="Jodhpur">Jodhpur</option>
                        <option value="Mumbai">Mumbai</option>
                        <option value="Nanded">Nanded</option>
                    </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="select2-data-5-iu64" style="width: 1852px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-state-ao-container" aria-controls="select2-state-ao-container"><span class="select2-selection__rendered" id="select2-state-ao-container" role="textbox" aria-readonly="true" title="Chandigarh">Chandigarh</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                </div>
                <div class="form-group border-bottom pb-1">
                    <label for="exampleFormControlSelect1" class="mb-2"><span class="icofont-ui-calendar text-danger"></span> Date</label><br>
                    <input name="date" class="form-control border-0 p-0" type="date">
                </div>
                <button type="submit" class="btn btn-danger btn-block osahanbus-btn rounded-1">Search</button>
            </form>
        </div>
    </div>
    <div class="p-3 bg-warning">
        <div class="row m-0">
            <div class="col-6 py-1 pr-1 pl-0">
                <div class="p-3 bg-white shadow-sm rounded-1">
                    <img class="img-fluid" src="img/safe-vehicles.svg" alt="">
                    <p class="mb-0 mt-4 font-weight-bold">Safe and Hygenic<br>Vehicles</p>
                </div>
            </div>
            <div class="col-6 py-1 pl-1 pr-0">
                <div class="p-3 bg-white shadow-sm rounded-1">
                    <img class="img-fluid" src="img/customer-support.svg" alt="">
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
    <div class="p-3">
        <h6 class="text-center">Bus Discounts For You</h6>
        <div class="row m-0">
            <div class="col-6 py-1 pr-1 pl-0">
                <a href="listing.html">
                    <img class="img-fluid rounded-1 shadow-sm" src="img/offer1.jpg" alt="">
                </a>
            </div>
            <div class="col-6 py-1 pl-1 pr-0">
                <a href="listing.html">
                    <img class="img-fluid rounded-1 shadow-sm" src="img/offer2.jpg" alt="">
                </a>
            </div>
            <div class="col-6 py-1 pr-1 pl-0">
                <a href="listing.html">
                    <img class="img-fluid rounded-1 shadow-sm" src="img/offer3.jpg" alt="">
                </a>
            </div>
            <div class="col-6 py-1 pl-1 pr-0">
                <a href="listing.html">
                    <img class="img-fluid rounded-1 shadow-sm" src="img/offer4.jpg" alt="">
                </a>
            </div>
        </div>
    </div>
</div>
<!-- Footer Fixed -->

<!-- sidebar -->

<!-- Bootstrap core JavaScript -->
<script async="" src="https://www.google-analytics.com/analytics.js"></script><script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- slick Slider JS-->
<script type="text/javascript" src="vendor/slick/slick.min.js"></script>
<!-- Select Tool -->
<script src="vendor/select-tool/dist/js/select2.min.js"></script>
<!-- Sidebar JS-->
<script type="text/javascript" src="vendor/sidebar/hc-offcanvas-nav.js"></script>
<!-- Custom scripts for all pages-->
<script src="js/custom.js"></script>





</body>
</html>