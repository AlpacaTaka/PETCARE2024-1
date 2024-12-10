package com.example.iwebproyecto.beans.CoordinadorBeans;

import com.example.iwebproyecto.daos.BaseDao;

import java.time.LocalDateTime;

public class CoordinadorCredenciales extends BaseDao {

    private Integer idCoordinador_credenciales;
    private String correoElectronico;
    private String contrasenia;
    private CoordinadorCredenciales coordinador;
    private boolean requiereCambioClave;
    private String tokenRecuperacion;
    private LocalDateTime fechaExpiracionToken;

    public CoordinadorCredenciales getCoordinador() {
        return coordinador;
    }

    public void setCoordinador(CoordinadorCredenciales coordinador) {
        this.coordinador = coordinador;
    }



    public Integer getIdCoordinador_credenciales() {
        return idCoordinador_credenciales;
    }

    public void setIdCoordinador_credenciales(Integer idCoordinador_credenciales) {
        this.idCoordinador_credenciales = idCoordinador_credenciales;
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
