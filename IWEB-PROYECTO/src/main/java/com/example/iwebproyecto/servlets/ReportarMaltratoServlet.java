package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.DenunciaMaltrato;
import com.example.iwebproyecto.beans.Fotos;
import com.example.iwebproyecto.beans.Usuario;
import com.example.iwebproyecto.daos.DenunciaMaltratoDao;
import com.example.iwebproyecto.daos.FotoDao;
import com.example.iwebproyecto.daos.UsuarioDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.util.List;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;


import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ReportarMaltrato", value = "/ReportarMaltrato")
@MultipartConfig
public class ReportarMaltratoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DenunciaMaltrato denu = new DenunciaMaltrato();
        denu.setTamanio(request.getParameter("tamanio"));
        denu.setEspecie(request.getParameter("Especie"));
        if ("otro".equals(request.getParameter("Raza"))){
            denu.setRaza(request.getParameter("otra-raza"));
        }else{
            denu.setRaza(request.getParameter("Raza"));
        }
        if ("Otro".equals(request.getParameter("tipo-maltrato"))){
            denu.setTipoMaltrato(request.getParameter("otro-maltrato"));
        }else{
            denu.setTipoMaltrato(request.getParameter("tipo-maltrato"));
        }
        denu.setNombreApellidoMaltratador(request.getParameter("Nombre-maltratador"));
        denu.setDireccion(request.getParameter("Direccion"));
        if ("si".equals(request.getParameter("flexRadioDefault"))) {
            denu.setRealizoDenuncia(1);
        } else if ("no".equals(request.getParameter("flexRadioDefault"))) {
            denu.setRealizoDenuncia(0);
        }

        LocalDate fechaActual = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String fechaFormateada = fechaActual.format(formatter);
        denu.setFecha(fechaFormateada);



        //System.out.println(request.getParameter("tamanio"));
        //System.out.println(request.getParameter("Especie"));
        //System.out.println(request.getParameter("Raza"));
        //System.out.println(request.getParameter("otra-raza"));
        //System.out.println(request.getParameter("tipo-maltrato"));
        //System.out.println(request.getParameter("otro-maltrato"));
        //System.out.println(request.getParameter("Nombre-maltratador"));
        //System.out.println(request.getParameter("Direccion"));
        //System.out.println(request.getParameter("flexRadioDefault"));



        // Ruta de guardado en el servidor
        String uploadPath = getServletContext().getRealPath("") + File.separator + "common" + File.separator + "img";

        Fotos foto = new Fotos();
        foto.setRuta(uploadPath);

        FotoDao fotoDao = new FotoDao();
        fotoDao.GuadarFoto(foto);

        // Nombre del archivo
        String fileName = "("+foto.getIdFoto()+")"+request.getParameter("imagen");
        String filePath = uploadPath + File.separator + fileName;

        fotoDao.ActualizarFoto(foto,filePath);

        // Leer el contenido de la solicitud manualmente
        try (InputStream inputStream = request.getInputStream();
             FileOutputStream outputStream = new FileOutputStream(filePath)) {

            byte[] buffer = new byte[1024];
            int bytesRead;

            // Escribir los datos de entrada en el archivo de salida
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            System.out.println("Imagen guardada exitosamente en: " + filePath);
        } catch (Exception e) {
            e.printStackTrace();
        }

        denu.setFoto(foto);

        DenunciaMaltratoDao dDao = new DenunciaMaltratoDao();
        dDao.RegistrarDenunciaMaltrato(denu);

        response.sendRedirect("Inicio");




    }
}
