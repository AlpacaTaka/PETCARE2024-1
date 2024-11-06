package com.example.iwebproyecto.beans;

public class Administrador {
    private int administradorID;
    private String nombreUsuario;
    private String contrasenia;

    public Administrador() {}

    public Administrador(int administradorID, String nombreUsuario, String contrasenia) {
        this.administradorID = administradorID;
        this.nombreUsuario = nombreUsuario;
        this.contrasenia = contrasenia;
    }

    public int getAdministradorID() {
        return administradorID;
    }

    public void setAdministradorID(int administradorID) {
        this.administradorID = administradorID;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }
}
