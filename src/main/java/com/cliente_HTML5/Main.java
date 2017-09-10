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
        port(80); //PARA EL PUERTO 80

        staticFiles.location("/publico");



        ArrayList<Encuestado> listadoEncuestadosMain = new ArrayList<Encuestado>();
        listadoEncuestadosMain.add(new Encuestado(1,"Manuel Tolentino", "Jardines del Este", "Grado Universitario"));
        listadoEncuestadosMain.add(new Encuestado(2,"Gustavo Henriquez", "PUCMM", "Grado Universitario"));

        Encuestado.setListadoEcuestrados(listadoEncuestadosMain);

        get("/", (request, response) -> {
            response.redirect("/inicio");
            return "";
        });


        get("/inicio", (request,response)-> {
            Map<String, Object> model = new HashMap<>();

            model.put("encuestados", listadoEncuestadosMain);

            return new ModelAndView(model,"home.ftl");
        },freeMarkerEngine);

        get("/eliminar/:id", (request, response) -> {
            int indice=Integer.parseInt(request.params("id"));
            listadoEncuestadosMain.remove(indice-1);
            response.redirect("/inicio");
            return "";
        });


        get("/nuevo", (request,response)-> {
            Map<String, Object> model = new HashMap<>();



            return new ModelAndView(model,"nuevo.ftl");
        },freeMarkerEngine);

        //POST PARA RECIBIR LOS DATOS DEL FORM
        post("/nuevo", (request,response)-> {
            Map<String, Object> model = new HashMap<>();

            Encuestado nuevoEncuestado = new Encuestado(listadoEncuestadosMain.size()+1,request.queryParams("nombre"),request.queryParams("sector"),request.queryParams("nivelescolar"));
            listadoEncuestadosMain.add(nuevoEncuestado);
            response.redirect("/inicio");

            return new ModelAndView(model,"nuevo.ftl");
        },freeMarkerEngine);
    }



}
