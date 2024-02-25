/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ArticleDao;
import dao.CategorieArticleDao;
import dao.FournisseurDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Article;
import model.CategorieArticle;

/**
 *
 * @author Pc
 */
public class ArticleController extends HttpServlet {

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
        String path = "";
        try {
            /**
             * ****DELETE********
             */
            if (action != null && !action.equals("") && action.equals("delete")) {
                String idArticle = (String) request.getParameter("idArticle");
                ArticleDao.insertMouvement(idArticle);
                List<List<Object>> articles = ArticleDao.findAllArticle();
                request.setAttribute("article", articles);
                 /*recuperation de tout les Fournisseur*/
              request.setAttribute("listFournisseur",FournisseurDao.findAllFournisseur());
              /*recuperation de tout les categories*/
              request.setAttribute("listCategorie",CategorieArticleDao.findAllCategorie());
                path = "/article.jsp";
                /**
                 * ***READ*****
                 */
            } else if (action != null && !action.equals("") && action.equals("getlist")) {
              /*recuperation liste article*/
                List<List<Object>> articles = ArticleDao.findAllArticle();
                request.setAttribute("article", articles);
                path = "/article.jsp";
              /*recuperation de tout les Fournisseur*/
              request.setAttribute("listFournisseur",FournisseurDao.findAllFournisseur());
              /*recuperation de tout les categories*/
              request.setAttribute("listCategorie",CategorieArticleDao.findAllCategorie());
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
    
    String action = (String) request.getParameter("action");
    String idArticle = (String) request.getParameter("idArticle");
    String path = "";
    Article article = null;
    PrintWriter out = response.getWriter();
    
    try {
        if (action != null) { 
            if (action.equals("modifier")) {
                /*recuperation de nouvelle valeur*/
                String designation = (String)request.getParameter("designation");
                double prixFournisseur = Double.parseDouble(request.getParameter("prixFournisseur"));
                double prixVente = Double.parseDouble(request.getParameter("prixVente"));
                String idCategorie = (String)request.getParameter("idCategorie");
                String idFournisseur = (String) request.getParameter("idFournisseur");
                article = new Article(idArticle,designation,prixFournisseur,prixVente,idCategorie,idFournisseur);
                /*modification*/
                ArticleDao.update(article);
                List<List<Object>> articles = ArticleDao.findAllArticle();
                request.setAttribute("article", articles);
                /*recuperation de tout les Fournisseur*/
                request.setAttribute("listFournisseur",FournisseurDao.findAllFournisseur());
                /*recuperation de tout les categories*/
                request.setAttribute("listCategorie",CategorieArticleDao.findAllCategorie());
                path = "/article.jsp";
            } else if (action.equals("ajouter")) {
                  /*recuperation de nouvelle valeur*/
                String designation = (String)request.getParameter("designation");
                double prixFournisseur = Double.parseDouble(request.getParameter("prixFournisseur"));
                double prixVente = Double.parseDouble(request.getParameter("prixVente"));
                String idCategorie = (String)request.getParameter("idCategorie");
                String idFournisseur = (String) request.getParameter("idFournisseur");
         
               article = new Article(designation,prixFournisseur,prixVente,idCategorie,idFournisseur);
             /*insertion nouvelle article*/
                ArticleDao.insert(article);
                List<List<Object>> articles = ArticleDao.findAllArticle();
                request.setAttribute("article", articles);
                /*recuperation de tout les Fournisseur*/
                request.setAttribute("listFournisseur",FournisseurDao.findAllFournisseur());
                /*recuperation de tout les categories*/
                request.setAttribute("listCategorie",CategorieArticleDao.findAllCategorie());
                path = "/article.jsp";
            }
        }
        
          RequestDispatcher dispat = request.getRequestDispatcher(path);
          dispat.forward(request, response);
    } catch (Exception e) {
        out.print(e.getMessage());
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
