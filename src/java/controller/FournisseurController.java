/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.FournisseurDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Fournisseur;

/**
 *
 * @author Pc
 */
public class FournisseurController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        String path = "";
        try {
            /******DELETE*********/
            if (action != null && !action.equals("") && action.equals("delete")) {
                 String idFournisseur = (String) request.getParameter("idFournisseur");
                FournisseurDao.insertMouvement(idFournisseur);
                List<Fournisseur> fournisseurs = FournisseurDao.findAllFournisseur();
                request.setAttribute("listFournisseur", fournisseurs);
                path = "/fournisseur.jsp";
            /*****READ******/
            } else if(action != null && !action.equals("") && action.equals("getlist")) {
                List<Fournisseur> fournisseurs = FournisseurDao.findAllFournisseur();
                request.setAttribute("listFournisseur", fournisseurs);
                path = "/fournisseur.jsp";
            }

            RequestDispatcher dispat = request.getRequestDispatcher(path);
            dispat.forward(request, response);
        } catch (Exception e) {
            // Gestion de l'exception
            e.printStackTrace();

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
             response.setContentType("text/html;charset=UTF-8");
      String action ="";
      action = (String)request.getParameter("action");
      String idFournisseur = (String) request.getParameter("idFournisseur");
      String path = "";
       Fournisseur fournisseur = null;
       PrintWriter out = response.getWriter();
      try {
      if (action.equals("modifier")) {
          String nomFournisseur = request.getParameter("nomFournisseur");
          String contact = request.getParameter("contactFournisseur");
          
          fournisseur = new Fournisseur(idFournisseur,nomFournisseur,contact);
          FournisseurDao.update(fournisseur);
          List<Fournisseur> fournisseurs = FournisseurDao.findAllFournisseur();
          request.setAttribute("listFournisseur", fournisseurs);
          path = "/fournisseur.jsp";
       }else if(action.equals("ajouter")) {
         String nomFournisseur = request.getParameter("nomFournisseur");
          String contact = request.getParameter("contactFournisseur");
          
          fournisseur = new Fournisseur(idFournisseur,nomFournisseur,contact);
          FournisseurDao.insert(fournisseur);
          List<Fournisseur> fournisseurs = FournisseurDao.findAllFournisseur();
          request.setAttribute("listFournisseur", fournisseurs);
          path = "/fournisseur.jsp";
       }
        RequestDispatcher dispat = request.getRequestDispatcher(path);
        dispat.forward(request,response);  
       }catch (Exception e) {
         e.printStackTrace(); 
         out.println(e.getMessage());
    }
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
