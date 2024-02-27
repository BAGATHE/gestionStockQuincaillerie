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
import model.Article;


/**
 *
 * @author Pc
 */
public class ArticleDao {

    public static void insert(Article article) throws Exception {
        Connection con = null;
        PreparedStatement prdSt = null;
        String sql = "insert into Article values(concat('Article_',nextval('seqArticle')),?,?,?,?,?)";
        try {
            con = Connect.dbConnect("postgres");
            con.setAutoCommit(false);
            prdSt = con.prepareStatement(sql);
            prdSt.setString(1, article.getDesignation());
            prdSt.setDouble(2, article.getPrixFournisseur());
            prdSt.setDouble(3, article.getPrixVente());
            prdSt.setString(4, article.getIdCategorie());
            prdSt.setString(5, article.getIdFournisseur());
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

    public static void update(Article article) throws Exception {
        Connection con = null;
        PreparedStatement prdSt = null;
        String sql = "update Article set designation=?, prixFournisseur=?, prixVente=?, idCategorie=?, idFournisseur=? where idArticle=?";
        try {
            con = Connect.dbConnect("postgres");
            con.setAutoCommit(false);
            prdSt = con.prepareStatement(sql);
            prdSt.setString(1, article.getDesignation());
            prdSt.setDouble(2, article.getPrixFournisseur());
            prdSt.setDouble(3, article.getPrixVente());
            prdSt.setString(4, article.getIdCategorie());
            prdSt.setString(5, article.getIdFournisseur());
            prdSt.setString(6, article.getIdArticle());
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
    
  public static List<List<Object>> findAllArticle() throws SQLException {
    String sql = "SELECT A.idArticle, A.designation, A.prixFournisseur, A.prixVente, " +
             "C.nomCategorie, F.nomFournisseur " +
             "FROM Article A " +
             "JOIN CategorieArticle C ON A.idCategorie = C.idCategorie " +
             "JOIN Fournisseur F ON A.idFournisseur = F.idFournisseur " +
             "WHERE A.idArticle NOT IN (SELECT idArticle FROM MouvementArticle)";


    List<List<Object>> allArticle = new ArrayList<>();

    try (Connection con = Connect.dbConnect("postgres");
         PreparedStatement prdSt = con.prepareStatement(sql);
         ResultSet res = prdSt.executeQuery()) {
        while (res.next()) {
            List<Object> article = new ArrayList<>();
            article.add(res.getString("idArticle"));
            article.add(res.getString("designation"));
            article.add(res.getDouble("prixFournisseur"));
            article.add(res.getDouble("prixVente"));
            article.add(res.getString("nomCategorie"));
            article.add(res.getString("nomFournisseur"));
            allArticle.add(article);
        }
    } catch (SQLException e) {
        throw e;
    }
    return allArticle;
}


    public static Article findArticleById(String id) throws Exception {
        Connection con = null;
        PreparedStatement prdSt = null;
        ResultSet res = null;
        String sql = "select * from Article where idArticle=? ";
        Article article = null;
        try {
            con = Connect.dbConnect("postgres");
            prdSt = con.prepareStatement(sql);
            prdSt.setString(1, id);
            res = prdSt.executeQuery();
            while (res.next()) {
                article = new Article(res.getString("idArticle"), res.getString("designation"),res.getDouble("prixFournisseur"),res.getDouble("prixVente"),res.getString("idCategorie"),res.getString("idFournisseur"));
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            if (res != null) {
                res.close();
            }
            if (prdSt != null) {
                prdSt.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return article;
    }

    public static void insertMouvement(String idArticle) throws Exception {
        Connection con = null;
        PreparedStatement prdSt = null;
        String sql = "insert into MouvementArticle values(concat('MouvementArticle_',nextval('seqMouvementArticle')),?)";
        try {
            con = Connect.dbConnect("postgres");
            con.setAutoCommit(false);
            prdSt = con.prepareStatement(sql);
            prdSt.setString(1, idArticle);
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
    public static List<List<Object>> searchArticle(double prixMin, double prixMax, String idFournisseur, String idCategorie) throws SQLException {
    StringBuilder stringBuilder = new StringBuilder();

    stringBuilder.append("SELECT A.idArticle, A.designation, A.prixFournisseur, A.prixVente, A.idCategorie, A.idFournisseur, ");  // Added comma at the end
    stringBuilder.append("C.nomCategorie, F.nomFournisseur ");
    stringBuilder.append("FROM Article A ");
    stringBuilder.append("JOIN CategorieArticle C ON A.idCategorie = C.idCategorie ");
    stringBuilder.append("JOIN Fournisseur F ON A.idFournisseur = F.idFournisseur ");
    stringBuilder.append("WHERE A.idArticle NOT IN (SELECT idArticle FROM MouvementArticle)");

    if (prixMin >= 0 && prixMin < prixMax) {
        stringBuilder.append(" AND A.prixVente > ").append(prixMin);
    }
    if (prixMax > 0 && prixMax > prixMin) {
        stringBuilder.append(" AND A.prixVente < ").append(prixMax);
    }
    if (idFournisseur != null && !idFournisseur.isEmpty()) {
        stringBuilder.append(" AND A.idFournisseur='").append(idFournisseur).append("'");
    }
    if (idCategorie != null && !idCategorie.isEmpty()) {
        stringBuilder.append(" AND A.idCategorie='").append(idCategorie).append("'");
    }

    List<List<Object>> allArticle = new ArrayList<>();

    Connection con = null;
    PreparedStatement prdSt = null;
    ResultSet res = null;

    try {
        con = Connect.dbConnect("postgres");
        prdSt = con.prepareStatement(stringBuilder.toString());
        res = prdSt.executeQuery();

        while (res.next()) {
            List<Object> article = new ArrayList<>();
            article.add(res.getString("idArticle"));
            article.add(res.getString("designation"));
            article.add(res.getDouble("prixFournisseur"));
            article.add(res.getDouble("prixVente"));
            article.add(res.getString("nomCategorie"));
            article.add(res.getString("nomFournisseur"));
            allArticle.add(article);
        }
    } catch (SQLException e) {
        throw e;
    } finally {
        // Close resources in finally block to ensure they are always closed
        if (res != null) {
            try {
                res.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (prdSt != null) {
            try {
                prdSt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    return allArticle;
}


}
