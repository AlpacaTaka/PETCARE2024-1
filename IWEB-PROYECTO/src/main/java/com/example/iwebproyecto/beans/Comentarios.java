package com.example.iwebproyecto.beans;

public class Comentarios {
    private int idComentarios;
    private String comentarios;
    private CoordinadorZona coordinadorZona;
    private PublicacionMascotaPerdida publicacionMascotaPerdida;
    private String fecha;

    public Comentarios() {}

    public Comentarios(int idComentarios, String comentarios, CoordinadorZona coordinadorZona, PublicacionMascotaPerdida publicacionMascotaPerdida, String fecha) {
        this.idComentarios = idComentarios;
        this.comentarios = comentarios;
        this.coordinadorZona = coordinadorZona;
        this.publicacionMascotaPerdida = publicacionMascotaPerdida;
        this.fecha = fecha;
    }

    public int getIdComentarios() {
        return idComentarios;
    }

    public void setIdComentarios(int idComentarios) {
        this.idComentarios = idComentarios;
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }


    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public CoordinadorZona getCoordinadorZona() {
        return coordinadorZona;
    }

    public void setCoordinadorZona(CoordinadorZona coordinadorZona) {
        this.coordinadorZona = coordinadorZona;
    }

    public PublicacionMascotaPerdida getPublicacionMascotaPerdida() {
        return publicacionMascotaPerdida;
    }

    public void setPublicacionMascotaPerdida(PublicacionMascotaPerdida publicacionMascotaPerdida) {
        this.publicacionMascotaPerdida = publicacionMascotaPerdida;
    }
}
