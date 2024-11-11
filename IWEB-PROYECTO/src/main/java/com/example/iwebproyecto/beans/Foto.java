package com.example.iwebproyecto.beans;

public class Foto {
    private int fotoID;
    private String rutaFoto;
    private String ubicacion;
    // Constructor vacío
    public Foto() {}
    // Constructor con todos los campos
    public Foto(int fotoID, String rutaFoto, String ubicacion) {
        this.fotoID = fotoID;
        this.rutaFoto = rutaFoto;
        this.ubicacion = ubicacion;
    }
    // Getters y Setters para cada campo
    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public int getFotoID() {
        return fotoID;
    }

    public void setFotoID(int fotoID) {
        this.fotoID = fotoID;
    }

    public String getRutaFoto() {
        return rutaFoto;
    }

    public void setRutaFoto(String rutaFoto) {
        this.rutaFoto = rutaFoto;
    }

    // Metodo toString para facilitar la visualización del objeto
    @Override
    public String toString() {
        return "Foto{" +
                "fotoID=" + fotoID +
                ", rutaFoto='" + rutaFoto + '\'' +
                ", ubicacion='" + ubicacion + '\'' +
                '}';
    }
}
