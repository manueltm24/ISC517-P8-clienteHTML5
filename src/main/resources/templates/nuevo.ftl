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

    <#--DEXIE DB-->
    <script src="https://unpkg.com/dexie@latest/dist/dexie.js"></script>
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
    <h1 class="well">Formulario para encuesta</h1>

    <div class="panel panel-primary">

        <div class="panel-body">
            <form  method="post" action="/nuevo" name="myForm">
                <div class="row">

                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="hidden" id="longitud" name="longitud" value=""/>
                            <input type="hidden" id="latitude" name="latitude" value=""/>
                                <fieldset>
                                    <div class="form-group">
                                        <label class="control-label" for="id">ID:</label>
                                        <input type="text" id="id" name="id" class="form-control" placeholder="Inserte su ID" required autofocus>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label" for="nombre">Nombre:</label>
                                        <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Inserte su nombre" required autofocus>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label" for="nivelescolar">Nivel Escolar:</label>
                                        <select name="nivelescolar" id="nivelescolar" class="form-control" required autofocus>
                                            <option value="Basico">Basico</option>
                                            <option value="Medio">Medio</option>
                                            <option value="Grado Universitario">Grado Universitario</option>
                                            <option value="PostGrado">PostGrado</option>
                                            <option value="Doctorado">Doctorado</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label" for="sector">Sector:</label>
                                        <input type="text" id="sector" name="sector" class="form-control" placeholder="Inserte su sector" required autofocus>
                                    </div>

                                    <div class="form-group">
                                        <button style="border-radius: 30px" class="btn btn-success" type="submit" onclick="insertarDB()">Registrar</button>
                                        <button style="border-radius: 30px" class="btn btn-danger" type="button" onclick="location.href = '/inicio'">Cancelar</button>
                                        <button style="border-radius: 30px" class="btn btn-primary" type="button" onclick="seleccionar()">Seleccionar</button>
                                        <button style="border-radius: 30px" class="btn btn-danger" type="button" onclick="borrar()">Borrar</button>
                                    </div>
                                </fieldset>

                        </div>
                    </div>
                </div>

            </form>
        </div>
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

<script src="../publico/dashGumTemplate/js/notify.min.js"></script>

<script type="application/javascript">

    //dependiendo el navegador busco la referencia del objeto.
    var indexedDB = window.indexedDB || window.mozIndexedDB || window.webkitIndexedDB || window.msIndexedDB
    //indicamos el nombre y la versión
    var dataBase = indexedDB.open("encuestado_db", 1);
    //se ejecuta la primera vez que se crea la estructura
    //o se cambia la versión de la base de datos.
    dataBase.onupgradeneeded = function (e) {
        console.log("Creando la estructura de la tabla");
        //obteniendo la conexión activa
        active = dataBase.result;
        //creando la colección:
        //En este caso, la colección, tendrá un ID autogenerado.
        var encuestados = active.createObjectStore("encuestados", { keyPath : 'id', autoIncrement : false } );
        //creando los indices. (Dado por el nombre, campo y opciones)
        encuestados.createIndex('por_id', 'id', {unique : false});

    };
    //El evento que se dispara una vez, lo
    dataBase.onsuccess = function (e) {
        console.log('Proceso ejecutado de forma correctamente');
    };
    dataBase.onerror = function (e) {
        console.error('Error en el proceso: '+e.target.errorCode);
    };

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

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition, showError);
        } else {
            x.innerHTML = "Geolocation is not supported by this browser.";
        }
    });


    function myNavFunction(id) {
        $("#date-popover").hide();
        var nav = $("#" + id).data("navigation");
        var to = $("#" + id).data("to");
        console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }

    function insertarDB() {

        var active_db = dataBase.result;
        var tx = active_db.transaction(["encuestados"], "readwrite");

        var id_encuestado = document.getElementById("id").value;
        var nombre_encuestado = document.getElementById("nombre").value;
        var nivelescolar_encuestado = document.getElementById("nivelescolar").value;
        var sector_encuestado = document.getElementById("sector").value;
        var latitude_encuestado = document.getElementById("latitude").value;
        var longitud_encuestado = document.getElementById("longitud").value;


        var encuestados = tx.objectStore("encuestados");

        request = encuestados.add({
            id: id_encuestado,
            nombre: nombre_encuestado,
            nivelescolar: nivelescolar_encuestado,
            sector: sector_encuestado,
            longitud: longitud_encuestado,
            latitud: latitude_encuestado
        });
    }

    function showPosition(position) {
        var lat = position.coords.latitude;
        var lon = position.coords.longitude;

        $('input[name="latitude"]').val(lat);
        $('input[name="longitud"]').val(lon);
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

    function seleccionar() {
        var active_db = dataBase.result;
        var transaction = active_db.transaction(["encuestados"]);
        var objectStore = transaction.objectStore("encuestados");
        var id_encuestado = document.getElementById("id").value;
        var request = objectStore.get(id_encuestado);
        request.onerror = function(event) {
            alert("Error al seleccionar de la base de datos");
        };
        request.onsuccess = function(event) {
            // Do something with the request.result!
            if(request.result) {
                var id = request.result.id;
                var nombre = request.result.nombre;
                var nivelescolar = request.result.nivelescolar;
                var sector = request.result.sector;

                document.getElementById("id").value = id;
                document.getElementById("nombre").value = nombre;
                document.getElementById("nivelescolar").value = nivelescolar;
                document.getElementById("sector").value = sector;
            } else {
                alert("No se pudo encontrar el dato en la base de datos local.");
            }
        };

    }

    function borrar(id_encuestado) {
        var active_db = dataBase.result;

        var request = active_db.transaction(["encuestados"], "readwrite")
                .objectStore("encuestados")
                .delete(id_encuestado);
        request.onsuccess = function(event) {
            alert("Objeto borrado de la base de datos local.");
        };

        window.location.replace("http://localhost:4567/inicio" + url_parametros);
    }
</script>

