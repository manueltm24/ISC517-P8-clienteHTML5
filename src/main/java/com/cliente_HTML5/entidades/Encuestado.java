package com.cliente_HTML5.entidades;

import java.util.ArrayList;

public class Encuestado {
    private int id;
    private String nombre;
    private String sector;
    private String nivelEscolar;
    private double latitud;
    private double longitud;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public String getNivelEscolar() {
        return nivelEscolar;
    }

    public void setNivelEscolar(String nivelEscolar) {
        this.nivelEscolar = nivelEscolar;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    public Encuestado(int id, String nombre, String sector, String nivelEscolar, double latitud, double longitud) {
        this.id = id;
        this.nombre = nombre;
        this.sector = sector;
        this.nivelEscolar = nivelEscolar;
        this.latitud = latitud;
        this.longitud = longitud;
    }

    //DATOS ESTATICOS

    public static ArrayList<Encuestado> getListadoEcuestrados() {
        return listadoEncuestado;
    }

    public static void setListadoEcuestrados(ArrayList<Encuestado> listadoEncuestado) {
        Encuestado.listadoEncuestado = listadoEncuestado;
    }

    public static ArrayList<Encuestado> listadoEncuestado;
}
