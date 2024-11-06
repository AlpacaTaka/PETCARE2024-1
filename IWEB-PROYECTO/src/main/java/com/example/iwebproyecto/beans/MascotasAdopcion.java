package com.example.iwebproyecto.beans;

public class MascotasAdopcion {
    private int idAdopcion;
    private String raza;
    private String lugarEncontrado;
    private String descripcionGeneral;
    private int edadAprox;
    private int seEncuentraTemporal;
    private String condicionesAdopcion;
    private int usuarioID;
    private int albergueID;
    private String sexo;
    private int fotoID;
    private String fecha;

    // Constructor vacio
    public MascotasAdopcion() {}

    // Constructor con todos los campos
    public MascotasAdopcion(int idAdopcion, String raza, String lugarEncontrado, String descripcionGeneral, int edadAprox, int seEncuentraTemporal,
                            String condicionesAdopcion, int usuarioID, int albergueID, String sexo, int fotoID, String fecha){
        this.idAdopcion = idAdopcion;
        this.raza = raza;
        this.lugarEncontrado = lugarEncontrado;
        this.descripcionGeneral = descripcionGeneral;
        this.edadAprox = edadAprox;
        this.seEncuentraTemporal = seEncuentraTemporal;
        this.condicionesAdopcion = condicionesAdopcion;
        this.usuarioID = usuarioID;
        this.albergueID = albergueID;
        this.sexo = sexo;
        this.fotoID = fotoID;
        this.fecha = fecha;
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

    public String getLugarEncontrado() {
        return lugarEncontrado;
    }

    public void setLugarEncontrado(String lugarEncontrado) {
        this.lugarEncontrado = lugarEncontrado;
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

    public int getSeEncuentraTemporal() {
        return seEncuentraTemporal;
    }

    public void setSeEncuentraTemporal(int seEncuentraTemporal) {
        this.seEncuentraTemporal = seEncuentraTemporal;
    }

    public String getCondicionesAdopcion() {
        return condicionesAdopcion;
    }

    public void setCondicionesAdopcion(String condicionesAdopcion) {
        this.condicionesAdopcion = condicionesAdopcion;
    }

    public int getUsuarioID() {
        return usuarioID;
    }

    public void setUsuarioID(int usuarioID) {
        this.usuarioID = usuarioID;
    }

    public int getAlbergueID() {
        return albergueID;
    }

    public void setAlbergueID(int albergueID) {
        this.albergueID = albergueID;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getFotoID() {
        return fotoID;
    }

    public void setFotoID(int fotoID) {
        this.fotoID = fotoID;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    @Override
    public String toString() {
        return "MascotasAdopcion{" +
                "idAdopcion=" + idAdopcion+
                ", raza='" + raza + '\'' +
                ", lugarEncontrado='" + lugarEncontrado + '\'' +
                ", descripcionGeneral='" + descripcionGeneral + '\'' +
                ", edadAprox=" + edadAprox + '\'' +
                ", seEncuentraTemporal=" + seEncuentraTemporal + '\'' +
                ", condicionesAdopcion='" + condicionesAdopcion + '\'' +
                ", usuarioID=" + usuarioID + '\'' +
                ", albergueID=" + albergueID + '\'' +
                ", sexo='" + sexo + '\'' +
                ", fotoID=" + fotoID + '\'' +
                ", fecha='" + fecha +
                '}';
    }
}
