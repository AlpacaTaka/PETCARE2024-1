package com.example.iwebproyecto.beans.AlbergueBeans;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.daos.BaseDao;

import java.time.LocalDateTime;

public class AlbergueCredenciales extends BaseDao {
    private Integer idAlbergueCredenciales;
    private String correoElectronico;
    private String contrasenia;
    private Albergue albergue;
    private boolean requiereCambioClave;
    private String tokenRecuperacion;
    private LocalDateTime fechaExpiracionToken;

    public Integer getIdAlbergueCredenciales() {
        return idAlbergueCredenciales;
    }

    public void setIdAlbergueCredenciales(Integer idAlbergueCredenciales) {
        this.idAlbergueCredenciales = idAlbergueCredenciales;
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

    public Albergue getAlbergue() {
        return albergue;
    }

    public void setAlbergue(Albergue albergue) {
        this.albergue = albergue;
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
