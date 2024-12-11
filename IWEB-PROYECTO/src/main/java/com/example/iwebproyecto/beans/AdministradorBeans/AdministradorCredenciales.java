package com.example.iwebproyecto.beans.AdministradorBeans;

import com.example.iwebproyecto.beans.Administrador;
import com.example.iwebproyecto.daos.BaseDao;

public class AdministradorCredenciales extends BaseDao {
    private Integer idAdministradorCredenciales;
    private String correoElectronico;
    private String contrasenia;
    private Administrador administrador;

    public Integer getIdAdministradorCredenciales() {
        return idAdministradorCredenciales;
    }

    public void setIdAdministradorCredenciales(Integer idAdministradorCredenciales) {
        this.idAdministradorCredenciales = idAdministradorCredenciales;
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

    public Administrador getAdministrador() {
        return administrador;
    }

    public void setAdministrador(Administrador administrador) {
        this.administrador = administrador;
    }


}
