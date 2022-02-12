<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en-US" xmlns:fb="https://www.facebook.com/2008/fbml" xmlns:addthis="https://www.addthis.com/help/api-spec"  prefix="og: http://ogp.me/ns#" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Faseyha Parking - Arrival Gate</title>
    <link rel="shortcut icon" href="https://learncodeweb.com/demo/favicon.ico">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type = "text/javascript"
            src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">
    </script>
    <!-- Global site tag (gtag.js) - Google Analytics -->

    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'UA-131906273-1');
    </script>
    <script src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
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
            max-width: 800px;
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

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>


<main class="form-signin">
    <img class="mb-4 mt-2" src="img/logo.png" alt="" width="100" height="">
        <h1 class="h3 mb-3 fw-normal">Please scan your QR Code</h1>
    <div class="container-fluid">
        <div class="row">
                <div class="row">
                    <video id="preview" class="p-1 border" style="width:100%;"></video>
                </div>


                <script type="text/javascript">
                    var scanner = new Instascan.Scanner({ video: document.getElementById('preview'), scanPeriod: 5, mirror: false });
                    scanner.addListener('scan',function(content){
                        //alert(content);
                        //window.location.href=content;
                        $('#message').text(content);
                        $.post("api/validateqr",
                            {
                                qrcode: content
                            },
                            function(data, status){
                                //alert("Data: " + data + "\nStatus: " + status);
                                messageqr.innerHTML = data;

                                setInterval('location.reload()', 7000);
                            });
                    });
                    Instascan.Camera.getCameras().then(function (cameras){
                        if(cameras.length>0){
                            scanner.start(cameras[0]);
                            $('[name="options"]').on('change',function(){
                                if($(this).val()==1){
                                    if(cameras[0]!=""){
                                        scanner.start(cameras[0]);
                                    }else{
                                        alert('No Front camera found!');
                                    }
                                }else if($(this).val()==2){
                                    if(cameras[1]!=""){
                                        scanner.start(cameras[1]);
                                    }else{
                                        alert('No Back camera found!');
                                    }
                                }
                            });
                        }else{
                            console.error('No cameras found.');
                            alert('No cameras found.');
                        }
                    }).catch(function(e){
                        console.error(e);
                        alert(e);
                    });
                </script>

            <div class="" role="alert" id="messageqr">
            </div>




        </div>
    </div>


</main>






</body>
</html>
