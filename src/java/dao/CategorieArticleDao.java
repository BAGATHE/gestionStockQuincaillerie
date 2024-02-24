/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.Connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CategorieArticle;

/**
 *
 * @author Pc
 */
public class CategorieArticleDao {
    
    
    public static void insert(CategorieArticle catArticle) throws Exception {
        Connection con = null;
        PreparedStatement prdSt = null;
        String sql = "insert into CategorieArticle values(concat('CategorieArticle_',nextval('seqCategorieArticle')),?)";
        try {
            con = Connect.dbConnect("postgres");
            con.setAutoCommit(false);
            prdSt = con.prepareStatement(sql);
            prdSt.setString(1, catArticle.getNomCategorie());
            prdSt.executeUpdate();
            con.commit();
        } catch (SQLException e) {
             if (con != null) con.rollback();
             throw e;
        } finally {
            if (prdSt != null) prdSt.close();
            if (con != null) con.close();
           
        }
    }

   public static void update(CategorieArticle catArticle) throws Exception {
    Connection con = null;
    PreparedStatement prdSt = null;
    String sql = "update CategorieArticle set Categorie=? where idCategorie=?";
    try {
        con = Connect.dbConnect("postgres");
        con.setAutoCommit(false);
        prdSt = con.prepareStatement(sql);
        prdSt.setString(1, catArticle.getNomCategorie());
        prdSt.setString(2, catArticle.getIdCategorie()); 
        prdSt.executeUpdate();
        con.commit();
    } catch (SQLException e) {
        if (con != null) con.rollback();
        throw e;
    } finally {
        if (prdSt != null) prdSt.close();
        if (con != null) con.close();
    }
}
  
   
 public static void delete(String idcategorie) throws Exception {
    Connection con = null;
    PreparedStatement prdSt = null;
    String sql = "DELETE FROM CategorieArticle WHERE idCategorie=?";
    try {
        con = Connect.dbConnect("postgres");
        con.setAutoCommit(false);
        prdSt = con.prepareStatement(sql);
        prdSt.setString(1, idcategorie);
        prdSt.executeUpdate();
        
        con.commit();
    } catch (SQLException e) {
        if (con != null) {
            con.rollback();
        }
        throw e;
    } finally {
        if (prdSt != null) {
            prdSt.close();
        }
        if (con != null) {
            con.close();
        }
    }
}

   public static List<CategorieArticle> findAllCategorie() throws Exception{
         Connection con = null;
         PreparedStatement prdSt = null;
         ResultSet res = null;
         String sql = "select * from CategorieArticle ";
        List<CategorieArticle> allCategories = new ArrayList<>();
        try{
           con = Connect.dbConnect("postgres");
           prdSt = con.prepareStatement(sql);
           res = prdSt.executeQuery();
           while(res.next()){
              CategorieArticle catArticle = new CategorieArticle(res.getString("idCategorie"),res.getString("nomCategorie"));
               allCategories.add(catArticle);
           }
        }catch(SQLException e){
            throw e;
        }finally{
           if(res != null) res.close();
           if (prdSt != null) prdSt.close();
           if (con != null) con.close();
        }
        return allCategories;
    }
   
    public static CategorieArticle findCategorieById(String id) throws Exception{
         Connection con = null;
         PreparedStatement prdSt = null;
         ResultSet res = null;
         String sql = "select * from CategorieArticle where idCategorie=? ";
         CategorieArticle  catArticles = null;
        try{
           con = Connect.dbConnect("postgres");
           prdSt = con.prepareStatement(sql);
           prdSt.setString(1,id);
           res = prdSt.executeQuery();
           while(res.next()){
                catArticles = new CategorieArticle(res.getString("idCategorie"),res.getString("nomCategorie"));
           }
        }catch(SQLException e){
            throw e;
        }finally{
           if(res != null) res.close();
           if (prdSt != null) prdSt.close();
           if (con != null) con.close();
        }
        return catArticles;
    }
    
}
