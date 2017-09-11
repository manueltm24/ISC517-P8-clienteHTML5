<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Cliente HTML5</title>

    <!-- Bootstrap core CSS -->
    <link href="dashGumTemplate/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="dashGumTemplate/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="dashGumTemplate/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="dashGumTemplate/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="dashGumTemplate/lineicons/style.css">

    <!-- Custom styles for this template -->
    <link href="dashGumTemplate/css/style.css" rel="stylesheet">
    <link href="dashGumTemplate/css/style-responsive.css" rel="stylesheet">


<#--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
<#--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
<#--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->

    <script src="dashGumTemplate/js/chart-master/Chart.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/geolocator/2.1.1/geolocator.min.js"></script>
</head>

<body>
<!--topBar INICIO-->
<!--header start-->
<header class="header black-bg">
    <!--logo start-->
    <a href="/inicio" class="logo"><b>Cliente HTML5</b></a>
    <!--logo end-->
</header>
<!--header end-->
<!--topBar FIN-->

<div style="padding-top: 50px" class="container">
    <h1 class="well">Listado de encuestados</h1>
</div>

<div class="panel-footer insertar" style="background-color: mintcream">

    <table class="table" >
        <thead>
        <tr>
            <th>#</th>
            <th>Nombre del encuestado</th>
        </tr>
        </thead>
    <tbody>
    <#if encuestados??>
        <#list encuestados as encuestado>
        <tr>
            <td>${encuestado.getId()}</td>
            <td>${encuestado.getNombre()}</td>
            <td>
                <div class="btn-group" role="group" aria-label="...">
                    <button type="button" class="btn btn-warning">Posición georeferencial</button>
                    <button type="button" class="btn btn-primary">Editar</button>
                    <button type="button" class="btn btn-danger" onclick="location.href='/eliminar/${encuestado.getId()?string.computer}'">Eliminar</button>
                    <button type="button" class="btn btn-success" onclick="sincronizar()">Sincronizar con el servidor</button>
                </div>
            </td>
        </tr>
        </tbody>
        </#list>
    </#if>
    </table>

</div>

<div id="ac-wrapper" style='display:none'>
    <div id="popup">
        <center>
            <h2>Geolocalizacion</h2>
            <div>
                <span class="close">&times;</span>
                <button onclick="getLocation()" class="flat-btn">Localizacion de usuario</button>
                <div id="mapholder"></div>
            </div>
            <input type="submit" name="submit" value="Submit" onClick="PopUp('hide')" />
        </center>
    </div>
</div>

<div class="panel panel-primary">

    <div class="panel-body">
        <button style="border-radius: 30px" class="btn btn-danger" type="button" onclick="location.href = '/nuevo'">Nueva Encuesta</button>
    </div>
</div>

<!--footer INICIO-->
<footer class="site-footer">
    <div class="text-center">
        2012-0467 (Manuel Tolentino) | (Gustavo Henriquez)
        <a href="/inicio" class="go-top">
            <i class="fa fa-angle-up"></i>
        </a>
    </div>
</footer>
<!--footer FIN-->

</body>

<script type="text/javascript"></script>
<!-- js placed at the end of the document so the pages load faster -->
<script src="dashGumTemplate/js/jquery.js"></script>
<script src="dashGumTemplate/js/jquery-1.8.3.min.js"></script>
<script src="dashGumTemplate/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="dashGumTemplate/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="dashGumTemplate/js/jquery.scrollTo.min.js"></script>
<script src="dashGumTemplate/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="dashGumTemplate/js/jquery.sparkline.js"></script>


<!--common script for all pages-->
<script src="dashGumTemplate/js/common-scripts.js"></script>

<script type="text/javascript" src="dashGumTemplate/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="dashGumTemplate/js/gritter-conf.js"></script>

<!--script for this page-->
<script src="dashGumTemplate/js/sparkline-chart.js"></script>
<script src="dashGumTemplate/js/zabuto_calendar.js"></script>

<script type="application/javascript">
    $(document).ready(function () {
        $("#date-popover").popover({html: true, trigger: "manual"});
        $("#date-popover").hide();
        $("#date-popover").click(function (e) {
            $(this).hide();
        });

        $("#my-calendar").zabuto_calendar({
            action: function () {
                return myDateFunction(this.id, false);
            },
            action_nav: function () {
                return myNavFunction(this.id);
            },
            ajax: {
                url: "show_data.php?action=1",
                modal: true
            },
            legend: [
                {type: "text", label: "Special event", badge: "00"},
                {type: "block", label: "Regular event", }
            ]
        });
    });


    function myNavFunction(id) {
        $("#date-popover").hide();
        var nav = $("#" + id).data("navigation");
        var to = $("#" + id).data("to");
        console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }

    function getParameterByName(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

    function PopUp(hideOrshow) {
        if (hideOrshow === 'hide') document.getElementById('ac-wrapper').style.display = "none";
        else document.getElementById('ac-wrapper').removeAttribute('style');
    }

    function mostrarEsconder() {
        var resultado = getParameterByName('insertado');

        if (resultado === 'si') {
            PopUp('show');
        }
    }

    window.onload = mostrarEsconder();

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition, showError);
        } else {
            x.innerHTML = "Geolocation is not supported by this browser.";
        }
    }
    function showPosition(position) {
        var latlon = position.coords.latitude + "," + position.coords.longitude;
        var img_url = "https://maps.googleapis.com/maps/api/staticmap?center="
                +latlon+"&zoom=14&size=400x300&sensor=false&key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU";
        document.getElementById("mapholder").innerHTML = "<img src='"+img_url+"'>";
    }
    //To use this code on your website, get a free API key from Google.
    //Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
    function showError(error) {
        switch(error.code) {
            case error.PERMISSION_DENIED:
                x.innerHTML = "User denied the request for Geolocation.";
                break;
            case error.POSITION_UNAVAILABLE:
                x.innerHTML = "Location information is unavailable.";
                break;
            case error.TIMEOUT:
                x.innerHTML = "The request to get user location timed out.";
                break;
            case error.UNKNOWN_ERROR:
                x.innerHTML = "An unknown error occurred.";
                break;
        }
    }

    function sincronizar() {

    }
</script>

