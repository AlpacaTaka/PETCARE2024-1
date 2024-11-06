package com.example.iwebproyecto.beans;

public class Comentarios {
    private int idComentarios;
    private String comentarios;
    private int coordinadorZona_coordinadorID;
    private int publicacionMascotaPerdida_PublicacionID;
    private String fecha;

    public Comentarios() {}

    public Comentarios(int idComentarios, String comentarios, int coordinadorZona_coordinadorID,
                       int publicacionMascotaPerdida_PublicacionID, String fecha) {
        this.idComentarios = idComentarios;
        this.comentarios = comentarios;
        this.coordinadorZona_coordinadorID = coordinadorZona_coordinadorID;
        this.publicacionMascotaPerdida_PublicacionID = publicacionMascotaPerdida_PublicacionID;
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

    public int getCoordinadorZona_coordinadorID() {
        return coordinadorZona_coordinadorID;
    }

    public void setCoordinadorZona_coordinadorID(int coordinadorZona_coordinadorID) {
        this.coordinadorZona_coordinadorID = coordinadorZona_coordinadorID;
    }

    public int getPublicacionMascotaPerdida_PublicacionID() {
        return publicacionMascotaPerdida_PublicacionID;
    }

    public void setPublicacionMascotaPerdida_PublicacionID(int publicacionMascotaPerdida_PublicacionID) {
        this.publicacionMascotaPerdida_PublicacionID = publicacionMascotaPerdida_PublicacionID;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

}
