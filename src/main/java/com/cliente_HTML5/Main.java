package com.cliente_HTML5;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


import com.cliente_HTML5.entidades.Encuestado;
import freemarker.template.Configuration;
import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;


import static spark.Spark.*;
import static spark.debug.DebugScreen.enableDebugScreen;

public class Main {

    public static void main(String[] args) {

        initSpark();
    }

    private static void initSpark() {
        Configuration configuration = new Configuration(Configuration.VERSION_2_3_23);
        configuration.setClassForTemplateLoading(Main.class, "/templates");
        FreeMarkerEngine freeMarkerEngine = new FreeMarkerEngine(configuration);

        //Linea para agregar la pantalla de debug. En productivo se debe quitar.
        enableDebugScreen();
        port(4567);

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
            for(Encuestado encuestado : listadoEncuestadosMain) {
                if (encuestado.getId() == id) {
                    listadoEncuestadosMain.remove(encuestado);
                }
            }
            response.redirect("/inicio");
            return "";
        });


        get("/nuevo", (request,response)-> {
            Map<String, Object> model = new HashMap<>();

            return new ModelAndView(model,"nuevo.ftl");
        },freeMarkerEngine);

        //POST PARA RECIBIR LOS DATOS DEL FORM
//        post("/nuevo", (request,response)-> {
//            Map<String, Object> model = new HashMap<>();
//
//            Encuestado nuevoEncuestado = new Encuestado(listadoEncuestadosMain.size()+1,request.queryParams("nombre"),request.queryParams("sector"),request.queryParams("nivelescolar"));
//            listadoEncuestadosMain.add(nuevoEncuestado);
//            response.redirect("/inicio");
//
//            return new ModelAndView(model,"nuevo.ftl");
//        },freeMarkerEngine);
    }



}
