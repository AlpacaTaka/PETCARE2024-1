package com.example.iwebproyecto.beans;

public class Fotos {
    private int idFoto;
    private String ruta;
    private String ubicacion;

    public int getIdFoto() {
        return idFoto;
    }

    public void setIdFoto(int idFoto) {
        this.idFoto = idFoto;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    // Metodo toString para facilitar la visualización del objeto
    @Override
    public String toString() {
        return "Foto{" +
                "fotoID=" + idFoto +
                ", rutaFoto='" + ruta + '\'' +
                ", ubicacion='" + ubicacion + '\'' +
                '}';
    }
}
