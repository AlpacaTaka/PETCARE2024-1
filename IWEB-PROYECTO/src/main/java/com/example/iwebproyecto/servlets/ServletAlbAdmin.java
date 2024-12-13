package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.beans.Distrito;
import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.Usuario;
import com.example.iwebproyecto.daos.AdminCuentasDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="ServletAlbAdmin", value = "/AlbAdmin")
public class ServletAlbAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "create" : request.getParameter("action");
        AdminCuentasDao admin = new AdminCuentasDao();
        int idAdmin = 4;
        switch (action) {
            case "edit":
                String id = request.getParameter("id");
                Albergue albergue = admin.obtenerAlberguePorID(Integer.parseInt(id));
                request.setAttribute("albergue", albergue);
                request.getRequestDispatcher("Administrador/editarAlbergue.jsp").forward(request, response);

            case "view":
                String idv = request.getParameter("id");
                Albergue alberguev = admin.obtenerAlberguePorID(Integer.parseInt(idv));
                request.setAttribute("albergue", alberguev);
                request.setAttribute("idAdmin", idAdmin);
                request.getRequestDispatcher("Administrador/verAlbergue.jsp").forward(request,response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        AdminCuentasDao adminCuentasDao = new AdminCuentasDao();
        Albergue albergue = new Albergue();
        String nombreAlb = request.getParameter("nombreAlb");
        String nombreEnc = request.getParameter("nombreEncAlb");
        String apellidoEnc = request.getParameter("apelEncAlb");
        int espDisponible = Integer.parseInt(request.getParameter("espacioDisponible"));
        String fechaCreacion = request.getParameter("fecha");
        String correoElectronico = request.getParameter("correo");
        int cantAnimales = Integer.parseInt(request.getParameter("animalesAlbergados"));
        String urlFB = "facebook.com/Albergue29";
        String urlIG = "instagram.com/Albergue29";
        String direccion = request.getParameter("Direccion");
        int distritoAlb = Integer.parseInt(request.getParameter("idDistrito"));
        String puntoAcopio = request.getParameter("puntoAcopio");
        String direcDonaciones = request.getParameter("direcDonaciones");
        String nombreContactoDonac = request.getParameter("nombreDonaciones");
        String numeroContactoDonac = request.getParameter("numeroDonaciones");
        String numYape = "987654321";
        String numPlin = "999888777";
        String codQR = "QR1";
        boolean aprobado = true;
        int fotoID = 30;
        String mensaje = "Albergue destinado a ayudar a todos los animales posibles";
        boolean eliminado = false;
        String fechaRegistro = "2024-11-01";
        String descripcion = "albergue destinado a ayudar a los animales";
        albergue.setNombreAlbergue(nombreAlb);
        albergue.setNombreEncargado(nombreEnc);
        albergue.setApellidoEncargado(apellidoEnc);
        albergue.setEspaciosDisponibles(espDisponible);
        albergue.setFechaCreacion(fechaCreacion);
        albergue.setCorreoElectronico(correoElectronico);
        albergue.setCantidadAnimales(cantAnimales);
        albergue.setUrlFacebook(urlFB);
        albergue.setUrlInstagram(urlIG);
        albergue.setDireccion(direccion);
        Distrito distrito = new Distrito();
        distrito.setDistritoID(distritoAlb);
        albergue.setDistrito(distrito);
        albergue.setPuntoAcopioDonaciones(puntoAcopio);
        albergue.setDireccionDonaciones(direcDonaciones);
        albergue.setNombreContactoDonaciones(nombreContactoDonac);
        albergue.setNumeroContactoDonaciones(numeroContactoDonac);
        albergue.setNumeroYape(numYape);
        albergue.setNumeroPlin(numPlin);
        albergue.setCodigoQR(codQR);
        albergue.setAprobado(aprobado);
        Foto foto = new Foto();
        foto.setFotoID(fotoID);
        albergue.setFoto(foto);
        albergue.setMensaje(mensaje);
        albergue.setEliminado(eliminado);
        albergue.setFechaRegistrado(fechaRegistro);
        albergue.setDescripcion(descripcion);
        switch (action){

            case "edit":
                albergue.setAlbergueID(Integer.parseInt(request.getParameter("id")));
                adminCuentasDao.editarAlbergue(albergue);
                response.sendRedirect(request.getContextPath()+"/admincuentas");
                break;

        }

    }

}
