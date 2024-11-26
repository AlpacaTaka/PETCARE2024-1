package com.example.iwebproyecto.beans;

public class UsuarioAdopcion {
    private int usuarioAdopcionID;
    private Usuario usuario;
    private MascotasAdopcion mascotasAdopcion;
    private boolean aprobado;
    private String fechaAdoptado;

    public int getUsuarioAdopcionID() {
        return usuarioAdopcionID;
    }

    public void setUsuarioAdopcionID(int usuarioAdopcionID) {
        this.usuarioAdopcionID = usuarioAdopcionID;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public MascotasAdopcion getMascotasAdopcion() {
        return mascotasAdopcion;
    }

    public void setMascotasAdopcion(MascotasAdopcion mascotasAdopcion) {
        this.mascotasAdopcion = mascotasAdopcion;
    }

    public boolean isAprobado() {
        return aprobado;
    }

    public void setAprobado(boolean aprobado) {
        this.aprobado = aprobado;
    }

    public String getFechaAdoptado() {
        return fechaAdoptado;
    }

    public void setFechaAdoptado(String fechaAdoptado) {
        this.fechaAdoptado = fechaAdoptado;
    }
}
