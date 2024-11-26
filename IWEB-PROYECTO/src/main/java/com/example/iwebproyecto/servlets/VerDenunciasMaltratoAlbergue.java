package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.daos.AlbergueDao;
import com.example.iwebproyecto.daos.AlbergueDaoRevenge;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "VerDenunciasMaltratoAlbergue", value = "/DenunciasDeMaltrato")
public class VerDenunciasMaltratoAlbergue extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Establece el tipo de contenido de la respuesta
        response.setContentType("text/html");

        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();
        AlbergueDao albergueDao = new AlbergueDao();
        int idAlbergue= 6;
        switch (action) {
            case "lista":
                Albergue albergue = albergueDao.obtenerAlberguePorID(idAlbergue);
                ArrayList<DenunciaMaltrato> list = albergueDaoRevenge.listaDenunciasMaltrato(albergue.getDistrito().getZona().getZonaID());
                request.setAttribute("lista", list);
                RequestDispatcher rd = request.getRequestDispatcher("albergue/verDenunciasMaltrato.jsp");
                rd.forward(request, response);
                break;
            case "view":
                String idv = request.getParameter("id");
                DenunciaMaltrato denunciaMaltrato = albergueDaoRevenge.obtenerDenunciaMaltratoPorID(Integer.parseInt(idv));
                request.setAttribute("denuncia",denunciaMaltrato);
                request.setAttribute("idAlbergue", idAlbergue);
                request.getRequestDispatcher("albergue/verMascotaMaltrato.jsp").forward(request,response);
                break;
        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*String action = request.getParameter("action");
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();
        String nombreMascota = request.getParameter("nombreMascota");
        String especie = request.getParameter("especie");
        String raza = request.getParameter("raza");
        raza=raza.toUpperCase().charAt(0)+raza.substring(1,raza.length());
        String otraRaza = request.getParameter("otraRaza");
        if (raza.equals("Otro")) {
            raza=otraRaza;
        }
        if (raza.isEmpty()){
            raza="Fermosa";
        }
        int idDistrito = Integer.parseInt(request.getParameter("idDistrito"));
        String direccion = request.getParameter("direccionHallazgo");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String sexo = request.getParameter("sexoMascota");
        String descripcion = request.getParameter("breveDescripcion");
        int idFoto = 30;request.getParameter("rutaFoto");
        boolean seEncuentraTemporal= Boolean.parseBoolean(request.getParameter("hogarTemp"));
        String condicionesAdopcion = request.getParameter("condiciones");
        int albergueID = 6;Integer.parseInt(request.getParameter("idAlbergue"));
        boolean eliminado = false;
        MascotasAdopcion mascota = new MascotasAdopcion();
        mascota.setNombreMascota(nombreMascota);
        mascota.setEspecie(especie);
        mascota.setRaza(raza);
        Distrito distrito = new Distrito();
        distrito.setDistritoID(idDistrito);
        mascota.setDistrito(distrito);
        mascota.setDireccionHallazgo(direccion);
        mascota.setEdadAprox(edad);
        mascota.setSexo(sexo);
        mascota.setDescripcionGeneral(descripcion);
        Foto foto = new Foto();
        foto.setFotoID(idFoto);
        mascota.setFoto(foto);
        mascota.setSeEncuentraTemporal(seEncuentraTemporal);
        mascota.setCondicionesAdopcion(condicionesAdopcion);
        Albergue albergue = new Albergue();
        albergue.setAlbergueID(albergueID);
        mascota.setAlbergue(albergue);
        mascota.setEliminado(eliminado);
        switch (action) {
            case "create":
                albergueDaoRevenge.crearMascotaAdopcion(mascota);
                response.sendRedirect(request.getContextPath()+"/PortalAdopciones");
                break;
            case "edit":
                mascota.setIdAdopcion(Integer.parseInt(request.getParameter("id")));
                albergueDaoRevenge.editarMascotaAdopcion(mascota);
                response.sendRedirect(request.getContextPath()+"/PortalAdopciones");
                break;
        }*/
    }
}