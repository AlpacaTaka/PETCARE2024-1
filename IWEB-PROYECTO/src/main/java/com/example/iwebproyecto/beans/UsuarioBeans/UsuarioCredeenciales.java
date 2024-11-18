package com.example.iwebproyecto.beans.UsuarioBeans;


import com.example.iwebproyecto.beans.Usuario;
import com.example.iwebproyecto.daos.BaseDao;

import java.time.LocalDateTime;

public class UsuarioCredeenciales extends BaseDao {
    private Integer idUsuarioCredeenciales;
    private String correoElectronico;
    private String contrasenia;
    private Usuario usuario;
    private boolean requiereCambioClave;
    private String tokenRecuperacion;
    private LocalDateTime fechaExpiracionToken;


    public Integer getIdUsuarioCredeenciales() {
        return idUsuarioCredeenciales;
    }

    public void setIdUsuarioCredeenciales(Integer idUsuarioCredeenciales) {
        this.idUsuarioCredeenciales = idUsuarioCredeenciales;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public boolean isRequiereCambioClave() {
        return requiereCambioClave;
    }

    public void setRequiereCambioClave(boolean requiereCambioClave) {
        this.requiereCambioClave = requiereCambioClave;
    }

    public String getTokenRecuperacion() {
        return tokenRecuperacion;
    }

    public void setTokenRecuperacion(String tokenRecuperacion) {
        this.tokenRecuperacion = tokenRecuperacion;
    }

    public LocalDateTime getFechaExpiracionToken() {
        return fechaExpiracionToken;
    }

    public void setFechaExpiracionToken(LocalDateTime fechaExpiracionToken) {
        this.fechaExpiracionToken = fechaExpiracionToken;
    }
}
