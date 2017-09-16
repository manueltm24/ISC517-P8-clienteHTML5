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
            <th>Latitud</th>
            <th>Longitud</th>

        </tr>
        </thead>
    <tbody>
    <#if encuestados??>
        <#list encuestados as encuestado>
        <tr>
            <td>${encuestado.getId()}</td>
            <td>${encuestado.getNombre()}</td>
            <td>${encuestado.getLatitud()}</td>
            <td>${encuestado.getLongitud()}</td>


            <td>
                <div class="btn-group" role="group" aria-label="...">
                    <button type="button" class="btn btn-danger" onclick="location.href='/eliminar/${encuestado.getId()?string.computer}'">Eliminar</button>
                    <button type="button" class="btn btn-success" onclick="location.href='/geolocalizacion/${encuestado.getId()?string.computer}'">Mostrar geolocalizacion</button>
                </div>
            </td>
        </tr>
        </tbody>
        </#list>
    </#if>
    </table>

</div>


<div class="panel panel-primary">

    <div class="panel-body row form-inline">
        <button style="border-radius: 30px" class="btn btn-primary" type="button" onclick="location.href = '/nuevo'">Nueva Encuesta</button>
        <button style="border-radius: 30px" class="btn btn-success" type="button" id="sincronizar">Sincronizar con servidor</button>
    </div>

    <#--<div class="form-group">-->
        <#--<input type="number" placeholder="Latitud" class="form-control" name="latitude" id="latitude" aria-describedby="sizing-addon1"-->
               <#--size="10" pattern=".{4,}">-->
    <#--</div>-->

    <#--<div class="form-group">-->
        <#--<input type="number" placeholder="Longitud" class="form-control" name="longitud" id="longitud" aria-describedby="sizing-addon1"-->
               <#--size="10" pattern=".{4,}">-->
    <#--</div>-->
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

<#--POPUP-->

<div class="container">
    <!-- Modal -->
    <div class="modal fade"  id="localizacionPop" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Localizacion</h4>
                </div>
                <div  class="modal-body">
                    <div id="map">

                    </div>
                </div>
            <#--<div class="modal-footer">-->
            <#--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
            <#--</div>-->
            </div>

        </div>
    </div>
</div>

<#--POPUP FIN-->


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

<#--<script type="text/javascript">-->
<#--$(document).ready(function () {-->
<#--var unique_id = $.gritter.add({-->
<#--// (string | mandatory) the heading of the notification-->
<#--title: 'Welcome to Dashgum!',-->
<#--// (string | mandatory) the text inside the notification-->
<#--text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo. Free version for <a href="http://blacktie.co" target="_blank" style="color:#ffd777">BlackTie.co</a>.',-->
<#--// (string | optional) the image to display on the left-->
<#--image: 'dashGumTemplate/img/ui-sam.jpg',-->
<#--// (bool | optional) if you want it to fade out on its own or just sit there-->
<#--sticky: true,-->
<#--// (int | optional) the time you want it to be alive for before fading out-->
<#--time: '',-->
<#--// (string | optional) the class name you want to apply to that specific message-->
<#--class_name: 'my-sticky-class'-->
<#--});-->

<#--return false;-->
<#--});-->
<#--</script>-->

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
        var encuestados = active.createObjectStore("encuestados", {keyPath: 'id', autoIncrement: false});

        //creando los indices. (Dado por el nombre, campo y opciones)
        encuestados.createIndex('por_id', 'id', {unique: true});

    };

    $(document).ready(function () {
        $("#sincronizar").click(function () {
            if (navigator.onLine) {
            alert("Vamos a sincronizar");
                listarDatos();
            } else {
                alert('Actualmente el navegador esta offline');
            }

        });
    });

    function listarDatos() {

        //por defecto si no lo indico el tipo de transacción será readonly
        var data = dataBase.result.transaction(["encuestados"]);
        var encuestas = data.objectStore("encuestados");
        var contador = 0;
        var encuestas_recuperados = [];

        //abriendo el cursor.
        encuestas.openCursor().onsuccess = function (e) {
            //recuperando la posicion del cursor
            var cursor = e.target.result;
            if (cursor) {
                contador++;
                //recuperando el objeto.
                encuestas_recuperados.push(cursor.value);

                //Función que permite seguir recorriendo el cursor.
                cursor.continue();

            } else {
                console.log("La cantidad de registros recuperados es: " + contador);
            }
        };

        //Una vez que se realiza la operación llamo la impresión.
        data.oncomplete = function () {
            //imprimirTabla(encuestas_recuperados);
            sincronizar(encuestas_recuperados);
        }

    }

    function sincronizar(lista){
        console.log(lista);
        for (var key in lista) {
            console.log( lista[key].nombre+"/"+lista[key].sector+ "/"
                    + lista[key].nivelescolar+"/"+lista[key].latitud+"/"+ lista[key].longitud);

            $.ajax({
                type: "POST",
                url:'/nuevo',
                dataType: "JSON",
                contentType:"application/json; charset=utf-8",
                data:JSON.stringify({
                    nombre: lista[key].nombre,
                    sector:lista[key].sector,
                    nivelEscolar:lista[key].nivelescolar,
                    latitud: lista[key].latitud,
                    longitud: lista[key].longitud

                })
                ,
                success:(function (data) {
//                    alert(data.data)
                }),
                error :(function(data){
//                    alert(data.data)
                })
            });

        }
//        clearData();

    }


</script>




</body>
</html>
