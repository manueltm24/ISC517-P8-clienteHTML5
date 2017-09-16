package com.cliente_HTML5;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


import com.cliente_HTML5.entidades.Encuestado;
import com.google.gson.Gson;
import freemarker.template.Configuration;
import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;


import static spark.Spark.*;
import static spark.debug.DebugScreen.enableDebugScreen;

public class Main {

    public final static String ACCEPT_TYPE = "application/json";

    public static void main(String[] args) {

        initSpark();
    }

    private static void initSpark() {
        Configuration configuration = new Configuration(Configuration.VERSION_2_3_23);
        configuration.setClassForTemplateLoading(Main.class, "/templates");
        FreeMarkerEngine freeMarkerEngine = new FreeMarkerEngine(configuration);

        //Linea para agregar la pantalla de debug. En productivo se debe quitar.
        enableDebugScreen();
//        port(80);

        staticFiles.location("/publico");



        ArrayList<Encuestado> listadoEncuestadosMain = new ArrayList<Encuestado>();
//        listadoEncuestadosMain.add(new Encuestado(1,"Manuel Tolentino", "Jardines del Este", "Grado Universitario"));
//        listadoEncuestadosMain.add(new Encuestado(2,"Gustavo Henriquez", "PUCMM", "Grado Universitario"));

        Encuestado.setListadoEcuestrados(listadoEncuestadosMain);

        get("/", (request, response) -> {
            response.redirect("/inicio");
            return "";
        });


        get("/inicio", (request,response)-> {
            Map<String, Object> model = new HashMap<>();

            String insert = request.queryParams("insertado");

            model.put("encuestados", listadoEncuestadosMain);

            if (insert != null) {
                model.put("insertado", "si");
            } else {
                model.put("insertado", "si");
            }

            if (request.queryParams("id") != null) {
                int id = Integer.parseInt(request.queryParams("id"));
                String nombre = request.queryParams("nombre");
                String sector = request.queryParams("sector");
                String nivelescolar = request.queryParams("nivelescolar");
                double latitud = Double.parseDouble(request.queryParams("latitud"));
                double longitud = Double.parseDouble(request.queryParams("longitud"));

                listadoEncuestadosMain.add(new Encuestado(id, nombre, sector, nivelescolar, latitud, longitud));

                response.redirect("/inicio");
            }

            return new ModelAndView(model,"home.ftl");
        },freeMarkerEngine);

        get("/eliminar/:id", (request, response) -> {
            int id=Integer.parseInt(request.params("id"));
           for(int i=0;i<listadoEncuestadosMain.size();i++) {
                if (listadoEncuestadosMain.get(i).getId() == id) {
                    listadoEncuestadosMain.remove(listadoEncuestadosMain.get(i));
                }
            }
            response.redirect("/inicio");
            return "";
        });


        get("/nuevo", (request,response)-> {
            Map<String, Object> model = new HashMap<>();

            return new ModelAndView(model,"nuevo.ftl");
        },freeMarkerEngine);

        post("/nuevo", Main.ACCEPT_TYPE, (request, response) -> {
            Encuestado encuestado = new Gson().fromJson(request.body(), Encuestado.class);
            listadoEncuestadosMain.add(encuestado);

            return "Sincronizado con el servidor";

        },JsonConverter.json());

        get("/geolocalizacion/:id", (request,response)-> {
            Map<String, Object> model = new HashMap<>();
            Encuestado encuestado = new Encuestado();

            for(int i=0;i<listadoEncuestadosMain.size();i++){
                if(listadoEncuestadosMain.get(i).getId()==Integer.parseInt(request.params("id"))){
                    encuestado=listadoEncuestadosMain.get(i);
                }
            }

            model.put("encuestado",encuestado);

            return new ModelAndView(model,"geolocalizacion.ftl");
        },freeMarkerEngine);


    }



}
