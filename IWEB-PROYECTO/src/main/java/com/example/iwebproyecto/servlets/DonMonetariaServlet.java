package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.daos.AlbergueDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "TodosLosAlbergues", value = "/TodosLosAlbergues")
public class DonMonetariaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ?
                "lista" : request.getParameter("action");

        switch (action) {
            case "lista":

                AlbergueDao albergueDao = new AlbergueDao();
                ArrayList<Albergue> listaAlbergues = albergueDao.listarAlbergues();

                request.setAttribute("listaAlbergues", listaAlbergues);


                RequestDispatcher dispatcher = request.getRequestDispatcher("user/donacionMonetaria.jsp");
                dispatcher.forward(request, response);

                break;
            case "vista":
                int idAlbergue = Integer.parseInt(request.getParameter("id"));
                AlbergueDao albergueDao2 = new AlbergueDao();

                Albergue albergue= albergueDao2.obtenerAlberguePorID(idAlbergue);
                request.setAttribute("albergue", albergue);

                request.getRequestDispatcher("user/perfilAlbergue.jsp").forward(request, response);


                break;
            case "Donacion":

                break;
            default:

                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

