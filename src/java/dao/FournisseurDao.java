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
import model.Fournisseur;

/**
 *
 * @author Pc
 */
public class FournisseurDao {

    public static void insert(Fournisseur fournisseur) throws Exception {
        Connection con = null;
        PreparedStatement prdSt = null;
        String sql = "insert into Fournisseur values(concat('Fournisseur_',nextval('seqFournisseur')),?,?)";
        try {
            con = Connect.dbConnect("postgres");
            con.setAutoCommit(false);
            prdSt = con.prepareStatement(sql);
            prdSt.setString(1, fournisseur.getNomFournisseur());
            prdSt.setString(2, fournisseur.getContact());
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

   public static void update(Fournisseur fournisseur) throws Exception {
    Connection con = null;
    PreparedStatement prdSt = null;
    String sql = "update Fournisseur set nomFournisseur=?, contact=? where idFournisseur=?";
    try {
        con = Connect.dbConnect("postgres");
        con.setAutoCommit(false);
        prdSt = con.prepareStatement(sql);
        prdSt.setString(1, fournisseur.getNomFournisseur());
        prdSt.setString(2, fournisseur.getContact());
        prdSt.setString(3, fournisseur.getIdFournisseur()); 
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
  
   
 public static void delete(String idFournisseur) throws Exception {
    Connection con = null;
    PreparedStatement prdSt = null;
    String sql = "DELETE FROM Fournisseur WHERE idfournisseur=?";
    try {
        con = Connect.dbConnect("postgres");
        con.setAutoCommit(false);
        prdSt = con.prepareStatement(sql);
        prdSt.setString(1, idFournisseur);
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

   public static List<Fournisseur> findAllFournisseur() throws Exception{
         Connection con = null;
         PreparedStatement prdSt = null;
         ResultSet res = null;
         String sql = "select * from Fournisseur ";
        List<Fournisseur> allFournisseur = new ArrayList<>();
        try{
           con = Connect.dbConnect("postgres");
           prdSt = con.prepareStatement(sql);
           res = prdSt.executeQuery();
           while(res.next()){
               Fournisseur fournisseur = new Fournisseur(res.getString("idFournisseur"),res.getString("nomFournisseur"),res.getString("contact"));
               allFournisseur.add(fournisseur);
           }
        }catch(SQLException e){
            throw e;
        }finally{
           if(res != null) res.close();
           if (prdSt != null) prdSt.close();
           if (con != null) con.close();
        }
        return allFournisseur;
    }
   
    public static Fournisseur findFournisseurById(String id) throws Exception{
         Connection con = null;
         PreparedStatement prdSt = null;
         ResultSet res = null;
         String sql = "select * from Fournisseur where idFournisseur=? ";
         Fournisseur fournisseur = null;
        try{
           con = Connect.dbConnect("postgres");
           prdSt = con.prepareStatement(sql);
           prdSt.setString(1,id);
           res = prdSt.executeQuery();
           while(res.next()){
                fournisseur = new Fournisseur(res.getString("idFournisseur"),res.getString("nomFournisseur"),res.getString("contact"));
           }
        }catch(SQLException e){
            throw e;
        }finally{
           if(res != null) res.close();
           if (prdSt != null) prdSt.close();
           if (con != null) con.close();
        }
        return fournisseur;
    }
}
