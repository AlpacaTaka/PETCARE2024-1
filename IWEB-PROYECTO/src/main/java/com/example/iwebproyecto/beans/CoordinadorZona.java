package com.example.iwebproyecto.beans;

public class CoordinadorZona {
    private int coordinadorID;
    private String nombre;
    private String apellido;
    private String dni;
    private String contrasenia;
    private String correoElectronico;

    private String celular; /***Es un String cambiar la base de datos***/
    private String fechaNacimiento;
    private Foto foto;
    private String estado;
    private Zona zona;
    private boolean flag;

    public CoordinadorZona() {}

    public CoordinadorZona(int coordinadorID, String nombre, String apellido, String dni, String contrasenia, String correoElectronico, String celular, String fechaNacimiento, Foto foto, String estado, Zona zona, boolean flag) {

        this.coordinadorID = coordinadorID;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.contrasenia = contrasenia;
        this.correoElectronico = correoElectronico;
        this.celular = celular;
        this.fechaNacimiento = fechaNacimiento;

        this.foto = foto;
        this.estado = estado;
        this.zona = zona;

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


    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {

        this.celular = celular;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }



    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }


    public Foto getFoto() {
        return foto;
    }

    public void setFoto(Foto foto) {
        this.foto = foto;
    }

    public Zona getZona() {
        return zona;
    }

    public void setZona(Zona zona) {
        this.zona = zona;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {

        this.flag = flag;
    }
}

