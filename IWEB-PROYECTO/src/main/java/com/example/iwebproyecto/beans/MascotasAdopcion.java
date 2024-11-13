package com.example.iwebproyecto.beans;

public class MascotasAdopcion {
    private int idAdopcion;
    private String nombreMascota;
    private String especie;
    private String raza;
    private Distrito distrito;
    private String direccionHallazgo;
    private int edadAprox;
    private String sexo;
    private String descripcionGeneral;

    private boolean seEncuentraTemporal;
    private String condicionesAdopcion;
    private boolean eliminado;
    private Albergue albergue;

    private Foto foto;

    private String fechaAdoptado;

    // Constructor vacio
    public MascotasAdopcion() {}

    // Constructor con todos los campos


    public String getNombreMascota() {
        return nombreMascota;
    }

    public void setNombreMascota(String nombreMascota) {
        this.nombreMascota = nombreMascota;
    }

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    public Distrito getDistrito() {
        return distrito;
    }

    public void setDistrito(Distrito distrito) {
        this.distrito = distrito;
    }

    public String getDireccionHallazgo() {
        return direccionHallazgo;
    }

    public void setDireccionHallazgo(String direccionHallazgo) {
        this.direccionHallazgo = direccionHallazgo;
    }

    public boolean isSeEncuentraTemporal() {
        return seEncuentraTemporal;
    }

    public void setSeEncuentraTemporal(boolean seEncuentraTemporal) {
        this.seEncuentraTemporal = seEncuentraTemporal;
    }

    public boolean isEliminado() {
        return eliminado;
    }

    public void setEliminado(boolean eliminado) {
        this.eliminado = eliminado;
    }

    public String getFechaAdoptado() {
        return fechaAdoptado;
    }

    public void setFechaAdoptado(String fechaAdoptado) {
        this.fechaAdoptado = fechaAdoptado;
    }

    public int getIdAdopcion() {
        return idAdopcion;
    }

    public void setIdAdopcion(int idAdopcion) {
        this.idAdopcion = idAdopcion;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }



    public String getDescripcionGeneral() {
        return descripcionGeneral;
    }

    public void setDescripcionGeneral(String descripcionGeneral) {
        this.descripcionGeneral = descripcionGeneral;
    }

    public int getEdadAprox() {
        return edadAprox;
    }

    public void setEdadAprox(int edadAprox) {
        this.edadAprox = edadAprox;
    }



    public String getCondicionesAdopcion() {
        return condicionesAdopcion;
    }

    public void setCondicionesAdopcion(String condicionesAdopcion) {
        this.condicionesAdopcion = condicionesAdopcion;
    }


    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }



    public Albergue getAlbergue() {
        return albergue;
    }

    public void setAlbergue(Albergue albergue) {
        this.albergue = albergue;
    }

    public Foto getFoto() {
        return foto;
    }

    public void setFoto(Foto foto) {
        this.foto = foto;

    }
}
