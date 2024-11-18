package com.example.iwebproyecto.beans;

public class Administrador {
    private int administradorID;
    private String nombreUsuario;

    // Constructor vacío
    public Administrador() {}

    // Constructor con parámetros
    public Administrador(int administradorID, String nombreUsuario) {
        this.administradorID = administradorID;
        this.nombreUsuario = nombreUsuario;
    }

    // Getters y setters
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
}
