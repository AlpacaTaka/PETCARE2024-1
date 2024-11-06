package com.example.iwebproyecto.beans;

public class CoordinadorZona {
    private int coordinadorID;
    private String nombre;
    private String apellido;
    private String dni;
    private String contrasenia;
    private String correoElectronico;
    private int celular; /***Es un String cambiar la base de datos***/
    private String fechaNacimiento;
    private int fotos_fotoID;
    private String estado;
    private int zona_zonaID;
    private int flag;

    public CoordinadorZona() {}

    public CoordinadorZona(int coordinadorID, String nombre, String apellido, String dni, String contrasenia, String correoElectronico, int celular, String fechaNacimiento, int fotos_fotoID, String estado, int zona_zonaID, int flag) {
        this.coordinadorID = coordinadorID;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.contrasenia = contrasenia;
        this.correoElectronico = correoElectronico;
        this.celular = celular;
        this.fechaNacimiento = fechaNacimiento;
        this.fotos_fotoID = fotos_fotoID;
        this.estado = estado;
        this.zona_zonaID = zona_zonaID;
        this.flag = flag;
    }

    public int getCoordinadorID() {
        return coordinadorID;
    }

    public void setCoordinadorID(int coordinadorID) {
        this.coordinadorID = coordinadorID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public int getCelular() {
        return celular;
    }

    public void setCelular(int celular) {
        this.celular = celular;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getFotos_fotoID() {
        return fotos_fotoID;
    }

    public void setFotos_fotoID(int fotos_fotoID) {
        this.fotos_fotoID = fotos_fotoID;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getZona_zonaID() {
        return zona_zonaID;
    }

    public void setZona_zonaID(int zona_zonaID) {
        this.zona_zonaID = zona_zonaID;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }
}

