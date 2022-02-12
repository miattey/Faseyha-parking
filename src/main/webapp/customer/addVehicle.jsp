<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        .form-signin {
            width: 100%;
            max-width: 400px;
            padding: 15px;
            margin: auto;
            background-color: white;
        }

        .form-signin .checkbox {
            font-weight: 400;
        }

        .form-signin .form-floating:focus-within {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

    </style>

</head>
<body class="text-center">


<main class="form-signin">
    <form action="gettingstarted" method="post">
        <img class="mb-4" src="https://play-lh.googleusercontent.com/6bp77Aco1o6H5amfafw6kSQrnyXmZ63MrQtjCIKXukIzzSXctpPVpiweOBzPZRhDizE=s360-rw" alt="" width="100" height="">
        <h1 class="h3 mb-3 fw-normal">Lets get you started!</h1>
        <h1 class="h4 mb-3 fw-normal">Please fill in your vehicle details.</h1>

        <c:choose>
            <c:when test="${not empty errMessage}">
                <div class='alert alert-danger'><c:out value="${errMessage}"/></div>
            </c:when>
        </c:choose>


        <div class="form-floating">
            <input type="text" name="vehicle_registration" class="form-control" id="floatingInput" placeholder="Vehicle Registration">
            <label for="floatingInput">Vehicle Registration</label>
        </div>
        <div class="mt-2 form-floating">
            <input type="text" name="vehicle_type" class="form-control" id="floatingPassword" placeholder="Brand">
            <label for="floatingPassword">Vehicle Brand</label>
        </div>

        <button class="mt-2 w-100 btn btn-lg btn-primary" type="submit">Continue</button>
    </form>
</main>


</body>
</html>