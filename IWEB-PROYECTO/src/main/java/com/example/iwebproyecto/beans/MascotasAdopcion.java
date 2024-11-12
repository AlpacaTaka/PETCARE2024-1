package com.example.iwebproyecto.beans;

public class MascotasAdopcion {
    private int idAdopcion;
    private String nombre;
    private String especie;
    private String raza;
    private Distrito distrito;
    private String lugarEncontrado;
    private int edadAprox;
    private String sexo;
    private String descripcionGeneral;
    private Foto foto;
    private int seEncuentraTemporal;
    private String condicionesAdopcion;
    /*private Usuario usuario;*/
    private Albergue albergue;
    private String fechaAdoptado;
    private int eliminado;


    private String fecha;

    // Constructor vacio
    public MascotasAdopcion() {}

    // Constructor con todos los campos



    /*public MascotasAdopcion(int idAdopcion, String raza, String lugarEncontrado, String descripcionGeneral, int edadAprox, int seEncuentraTemporal, String condicionesAdopcion, Usuario usuario, Albergue albergue, String sexo, Foto foto, String fecha) {

        this.idAdopcion = idAdopcion;
        this.raza = raza;
        this.lugarEncontrado = lugarEncontrado;
        this.descripcionGeneral = descripcionGeneral;
        this.edadAprox = edadAprox;
        this.seEncuentraTemporal = seEncuentraTemporal;
        this.condicionesAdopcion = condicionesAdopcion;

        this.usuario = usuario;
        this.albergue = albergue;
        this.sexo = sexo;
        this.foto = foto;

        this.fecha = fecha;
    }*/

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


    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }


    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }


    /*public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }*/

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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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

    public String getFechaAdoptado() {
        return fechaAdoptado;
    }

    public void setFechaAdoptado(String fechaAdoptado) {
        this.fechaAdoptado = fechaAdoptado;
    }

    public int getEliminado() {
        return eliminado;
    }

    public void setEliminado(int eliminado) {
        this.eliminado = eliminado;
    }
}
