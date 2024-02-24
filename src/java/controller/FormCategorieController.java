/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategorieArticleDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategorieArticle;

/**
 *
 * @author Pc
 */
public class FormCategorieController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = (String) request.getParameter("action");
        PrintWriter out = response.getWriter();
        String path = "";
        CategorieArticle categorieArticle = null;
        try {
             if(action.equals("modifier")){
              String idCategorie = (String) request.getParameter("idCategorie");
              path = "/modificationCategorie.jsp";
              categorieArticle = CategorieArticleDao.findCategorieById(idCategorie);
              request.setAttribute("categorieArticle",categorieArticle);
            }
            RequestDispatcher dispat = request.getRequestDispatcher(path);
            dispat.forward(request, response);
        } catch (Exception e) {
            // Gestion de l'exception
            e.printStackTrace(); 
            out.println(e.getMessage());
          /*  // Redirigez vers une page d'erreur personnalisée
            request.setAttribute("error", "Une erreur s'est produite lors de la récupération des menus.");
            RequestDispatcher errorDispatcher = request.getRequestDispatcher("/error.jsp");
            errorDispatcher.forward(request, response);*/
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
